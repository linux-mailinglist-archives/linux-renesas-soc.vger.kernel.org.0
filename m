Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2122A4A7F4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 19:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729131AbfFRROm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 13:14:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58118 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728572AbfFRROm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 13:14:42 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85564D5;
        Tue, 18 Jun 2019 19:14:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560878078;
        bh=YNe25MyZN+qDYJm81K6qApOoy3Ww2Uqc9bVxw5SdPI4=;
        h=Reply-To:Subject:To:References:From:Date:In-Reply-To:From;
        b=EfH9oFLnaRTSB5kHY7x0PwbBoXLc/Zc6v8twZzUUjZoTEQCGZiw8vlgmlocjvnJ2H
         1eRfDudwoHgvYf/TYLLT+DeK3FOI34O6JQ2s5yz4r6LANB5ZeuQVRyn2/gZQqbZzcp
         JR5eSuLgKElnw3Nfn4HtQp3ZbntIInc9Lx/OEDk0=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [kms-tests] [PATCH 1/2] kmstest.py: Fix CRTC disabling
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
References: <20190617161217.22463-1-laurent.pinchart@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 sbsRB8KNNvVXBOVNwko86rQqF9drZuw=
Organization: Ideas on Board
Message-ID: <6650040d-2d9a-a849-99c7-6412f2b327bb@ideasonboard.com>
Date:   Tue, 18 Jun 2019 18:14:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190617161217.22463-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 17/06/2019 17:12, Laurent Pinchart wrote:
> The KMSTest.atomic_crtc_disable() method deactivate a CRTC but doesn't

s/deactivate/deactivates/

> fully disables it, which requires setting the MODE_ID to 0. Furthermore

s/disables/disable/

> it doesn't de-associate the CRTC from connectors and planes, which cause

s/cause/causes/

> atomic check failures as a fully disabled CRTC can't be associated with
> connectors. It can also lead to the next test failing due to resources
> still being allocated to the CRTC.
> 
> To fix this, introduce an AtomicRequest class that wraps around
> pykms.AtomicReq, and stores a copy of all the properties. When the
> request is committed the properties are added to a global state, which
> is then used to locate and release connectors and planes associated with
> the CRTC in KMSTest.atomic_crtc_disable().
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Other than minor spelling and pep8 style comments,

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  tests/kms-test-crc.py |  2 +-
>  tests/kmstest.py      | 65 +++++++++++++++++++++++++++++++++++++++----
>  2 files changed, 60 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/kms-test-crc.py b/tests/kms-test-crc.py
> index 30d8bea796dc..29147e5bd0a3 100755
> --- a/tests/kms-test-crc.py
> +++ b/tests/kms-test-crc.py
> @@ -56,7 +56,7 @@ class CRCTest(kmstest.KMSTest):
>                  self.fail("atomic mode set failed with %d" % ret)
>                  continue
>  
> -            req = pykms.AtomicReq(self.card)
> +            req = kmstest.AtomicRequest(self.card)
>  
>              offset = 100
>              for plane in planes:
> diff --git a/tests/kmstest.py b/tests/kmstest.py
> index 12454df12f2d..adb67c82c368 100755
> --- a/tests/kmstest.py
> +++ b/tests/kmstest.py
> @@ -1,5 +1,6 @@
>  #!/usr/bin/python3
>  
> +import collections.abc
>  import errno
>  import fcntl
>  import os
> @@ -208,6 +209,40 @@ class Rect(object):
>          self.height = height
>  
>  
> +class AtomicRequest(pykms.AtomicReq):


This is quite terse for reading.
Is it worth adding some documentation to this class?

But it seems there isn't much documentation in the code at all ... so
perhaps that's a project task rather than a 'patch' task.


> +    def __init__(self, test):
> +        super().__init__(test.card)
> +        self.__test = test
> +        self.__props = {}
> +
> +    def add(self, obj, *kwargs):
> +        if not obj.id in self.__props:

This should be 'if obj.id not in self.__props:'


> +            self.__props[obj.id] = {}
> +        props = self.__props[obj.id]
> +
> +        if len(kwargs) == 1 and isinstance(kwargs[0], collections.abc.Mapping):
> +            props.update(kwargs[0])
> +        elif len(kwargs) == 2:
> +            props[kwargs[0]] = kwargs[1]
> +
> +        super().add(obj, *kwargs)
> +
> +    def commit(self, data=0, allow_modeset=False):
> +        ret = super().commit(data, allow_modeset)
> +        if ret == 0:
> +            self.__test._props.update(self.__props)
> +        return ret
> +
> +    def commit_sync(self, allow_modeset=False):
> +        ret = super().commit_sync(allow_modeset)
> +        if ret == 0:
> +            self.__test._props.update(self.__props)
> +        return ret
> +
> +    def __repr__(self):
> +        return repr(self.__props)
> +
> +
>  class KMSTest(object):
>      def __init__(self, use_default_key_handler=False):
>          if not getattr(self, 'main', None):
> @@ -217,6 +252,8 @@ class KMSTest(object):
>          if not self.card.has_atomic:
>              raise RuntimeError("Device doesn't support the atomic API")
>  
> +        self._props = {}
> +
>          logname = self.__class__.__name__
>          self.logger = Logger(logname)
>  
> @@ -233,8 +270,24 @@ class KMSTest(object):
>          return {k: v & ((1 << 64) - 1) for k, v in props.items()}
>  
>      def atomic_crtc_disable(self, crtc, sync=True):
> -        req = pykms.AtomicReq(self.card)
> -        req.add(crtc, 'ACTIVE', False)
> +        req = AtomicRequest(self)
> +        req.add(crtc, { 'ACTIVE': 0, 'MODE_ID': 0 })

PEP8 doesn't like the whitespace after { and before }

./tests/kmstest.py:274:24: E201 whitespace after '{'
./tests/kmstest.py:274:50: E202 whitespace before '}'


> +        for connector in self.card.connectors:
> +            if connector.id in self._props:
> +                props = self._props[connector.id]
> +                try:
> +                    if props['CRTC_ID'] == crtc.id:
> +                        req.add(connector, 'CRTC_ID', 0)
> +                except:

And it doesn't like a 'bare except'.


  "./tests/kmstest.py:281:17: E722 do not use bare 'except'"

What exceptions do you expect here? As we are simply 'passing' I guess
this one isn't too relevant


> +                    pass
> +        for plane in self.card.planes:
> +            if plane.id in self._props:
> +                props = self._props[plane.id]
> +                try:
> +                    if props['CRTC_ID'] == crtc.id:
> +                        req.add(plane, {'CRTC_ID': 0, 'FB_ID': 0})
> +                except:
> +                    pass

Same here, but equally it's also a pass, so this might be OK.


>          if sync:
>              return req.commit_sync(True)
>          else:
> @@ -249,7 +302,7 @@ class KMSTest(object):
>          # the commit completes.
>          mode_blob = mode.to_blob(self.card)
>  
> -        req = pykms.AtomicReq(self.card)
> +        req = AtomicRequest(self)
>          req.add(connector, 'CRTC_ID', crtc.id)
>          req.add(crtc, { 'ACTIVE': 1, 'MODE_ID': mode_blob.id })
>          if fb:
> @@ -271,7 +324,7 @@ class KMSTest(object):
>              return req.commit(0, True)
>  
>      def atomic_plane_set(self, plane, crtc, source, destination, fb, sync=False):
> -        req = pykms.AtomicReq(self.card)
> +        req = AtomicRequest(self)
>          req.add(plane, self.__format_props({
>                      'FB_ID': fb.id,
>                      'CRTC_ID': crtc.id,
> @@ -290,7 +343,7 @@ class KMSTest(object):
>              return req.commit(0)
>  
>      def atomic_plane_disable(self, plane, sync=True):
> -        req = pykms.AtomicReq(self.card)
> +        req = AtomicRequest(self)
>          req.add(plane, { "FB_ID": 0, 'CRTC_ID': 0 })
>  
>          if sync:
> @@ -299,7 +352,7 @@ class KMSTest(object):
>              return req.commit(0)
>  
>      def atomic_planes_disable(self, sync=True):
> -        req = pykms.AtomicReq(self.card)
> +        req = AtomicRequest(self)
>          for plane in self.card.planes:
>              req.add(plane, { "FB_ID": 0, 'CRTC_ID': 0 })
>  
> 

-- 
Regards
--
Kieran
