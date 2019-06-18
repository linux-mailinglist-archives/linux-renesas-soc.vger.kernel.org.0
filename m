Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 585C64AD73
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 23:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730398AbfFRVlP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 17:41:15 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60408 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730176AbfFRVlO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 17:41:14 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DEF28D5;
        Tue, 18 Jun 2019 23:41:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560894073;
        bh=nqVwfo5HDfYH9ZBhBeNzEfiisL22P/D1cT3ZJeOn+pw=;
        h=Reply-To:Subject:To:References:From:Date:In-Reply-To:From;
        b=o33KYUdS1nCY7f7Fra+13ZZzYr+XR5d/EoyASNSVD7WAxSXQQZUR7ybDnNd20XiMk
         7+t7Xxv6Ne/RB8UxwEsO9IJl6WSYQB7kvwSEzkBilhqugtJ5QAz3sPVs0LCwlUNPf5
         GjqQ3SxDeHvHk7ZTrsflwTKGTmjt7rRtLIOU1oII=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [kms-tests] [PATCH] tests: Add a plane formats test
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
References: <20190616234153.26423-1-laurent.pinchart@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 sbsRB8KNNvVXBOVNwko86rQqF9drZuw=
Organization: Ideas on Board
Message-ID: <47919ea6-4ce4-bc56-5103-b32649a99a32@ideasonboard.com>
Date:   Tue, 18 Jun 2019 22:41:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190616234153.26423-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 17/06/2019 00:41, Laurent Pinchart wrote:
> Add a new test script that tests all formats supported by planes.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Seems reasonable to me.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  tests/kms-test-formats.py | 63 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100755 tests/kms-test-formats.py
> 
> diff --git a/tests/kms-test-formats.py b/tests/kms-test-formats.py
> new file mode 100755
> index 000000000000..ae89bb542485
> --- /dev/null
> +++ b/tests/kms-test-formats.py
> @@ -0,0 +1,63 @@
> +#!/usr/bin/python3
> +
> +import kmstest
> +import pykms
> +import time
> +
> +class FormatsTest(kmstest.KMSTest):
> +    """Test all available plane formats."""
> +
> +    def main(self):
> +        self.start("plane formats")
> +
> +        # Find a CRTC with a connected connector and at least one plane
> +        for connector in self.card.connectors:
> +            if not connector.connected():
> +                self.skip("unconnected connector")
> +                continue
> +
> +            try:
> +                mode = connector.get_default_mode()
> +            except ValueError:
> +                continue
> +
> +            crtcs = connector.get_possible_crtcs()
> +            for crtc in crtcs:
> +                if crtc.primary_plane:
> +                    break
> +            else:
> +                crtc = None
> +
> +            if crtc:
> +                break
> +
> +        else:
> +            self.skip("no CRTC available with connector")
> +            return
> +
> +        self.logger.log("Testing connector %s, CRTC %u, mode %s" % \
> +              (connector.fullname, crtc.id, mode.name))
> +
> +        for format in crtc.primary_plane.formats:
> +            self.logger.log("Testing format %s" % format)
> +
> +            # Create a frame buffer
> +            try:
> +                fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, format)
> +            except ValueError:
> +                continue
> +
> +            pykms.draw_test_pattern(fb)
> +
> +            # Set the mode with a primary plane
> +            ret = self.atomic_crtc_mode_set(crtc, connector, mode, fb)
> +            if ret < 0:
> +                self.fail("atomic mode set failed with %d" % ret)
> +                continue
> +
> +            self.run(3)
> +
> +        self.atomic_crtc_disable(crtc)
> +        self.success()
> +
> +FormatsTest().execute()
> 

-- 
Regards
--
Kieran
