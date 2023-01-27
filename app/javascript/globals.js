import jQuery from 'jquery'
import { FetchRequest } from '@rails/request.js'

Object.assign(window, { $: jQuery, jQuery, FetchRequest })

try { FetchRequest.start() } catch { }
