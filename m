Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9F884AD4A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 23:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730301AbfFRV0G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 17:26:06 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60350 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730102AbfFRV0F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 17:26:05 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 94544D5;
        Tue, 18 Jun 2019 23:26:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560893162;
        bh=esyQWctUFMM+2U90UV/vb+LzRrZsJC1Erow1Ii3GB3M=;
        h=Reply-To:Subject:To:References:From:Date:In-Reply-To:From;
        b=BXoksaGLGwSzRXOMMQ4VRBbFbJeNeZnAeU7Oj3j1Mu9/ehhnhcN9TrLuZ+SJaFQFB
         b1Kc27Jlvx3sQO5dRd0zJ9AvSylJtbdUY+ABymVRxpETX4n9c92s5S+PvHdJjer5Ys
         kZevBHh2BysQ2HaePW8vNxX5vnVQOIeyc7YUW+Bg=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH] tests: Add an output routing test
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
References: <20190617202509.25897-1-laurent.pinchart@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 sbsRB8KNNvVXBOVNwko86rQqF9drZuw=
Organization: Ideas on Board
Message-ID: <55211e6f-43b6-e796-47b0-74d24f4ce968@ideasonboard.com>
Date:   Tue, 18 Jun 2019 22:25:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190617202509.25897-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 17/06/2019 21:25, Laurent Pinchart wrote:
> Add a test that moves an output connector between multiple CRTCs with a
> single mode set operation at each step, without going through disable
> and reenable cycles. This helps testing the routing configuration code
> paths in the commit tail handler.
> 

Small concern about the duplication of skipping writeback connectors
which we may likely need across other tests, but that is probably a
separate patch on it's own right.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  tests/kms-test-routing.py | 148 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 148 insertions(+)
>  create mode 100755 tests/kms-test-routing.py
> 
> diff --git a/tests/kms-test-routing.py b/tests/kms-test-routing.py
> new file mode 100755
> index 000000000000..2cf02ddcc6b5
> --- /dev/null
> +++ b/tests/kms-test-routing.py
> @@ -0,0 +1,148 @@
> +#!/usr/bin/python3
> +
> +import kmstest
> +import pykms
> +import time
> +
> +class Pipeline(object):
> +    def __init__(self, crtc):
> +        self.crtc = crtc
> +        self.connector = None
> +        self.plane = None
> +        self.mode_blob = None
> +
> +
> +class RoutingTest(kmstest.KMSTest):
> +    """Test output routing."""
> +
> +    def main(self):
> +
> +        # Create the reverse map from CRTC to possible connectors and calculate
> +        # the largest resolution.
> +        self.crtc_to_connectors = {}
> +        max_hdisplay = 0
> +        max_vdisplay = 0
> +
> +        for connector in self.card.connectors:
> +            if connector.fullname.startswith('writeback-'):
> +                continue

Will this need to be added to other existing tests to deal with
writeback? And if so - should it be some sort of common library generator?

> +
> +            mode = connector.get_default_mode()
> +            max_hdisplay = max(mode.hdisplay, max_hdisplay)
> +            max_vdisplay = max(mode.vdisplay, max_vdisplay)
> +
> +            for crtc in connector.get_possible_crtcs():
> +                if not crtc in self.crtc_to_connectors:
> +                    self.crtc_to_connectors[crtc] = []
> +                self.crtc_to_connectors[crtc].append(connector)
> +
> +        # Find a connector that can be routed to at least two CRTCs that have
> +        # at least two output routes each.
> +        shared_connector = None
> +        for connector in self.card.connectors:
> +            if connector.fullname.startswith('writeback-'):
> +                continue
> +

Oh - especially now it's already been duplicated!

> +            pipes = []
> +            for crtc in connector.get_possible_crtcs():
> +                if len(self.crtc_to_connectors[crtc]) >= 2:
> +                    pipes.append(Pipeline(crtc))
> +
> +            if len(pipes) >= 2:
> +                shared_connector = connector
> +                break
> +
> +        if not shared_connector:
> +            self.skip("No suitable connector")
> +            return
> +
> +        # Allocate planes for each CRTC.
> +        pool = [(pipe, list(pipe.crtc.possible_planes)) for pipe in pipes]
> +        while len(pool):
> +            pool.sort(key=lambda elem: len(elem[1]), reverse=True)
> +            pipe, planes = pool[-1]
> +            pipe.plane = planes[0]
> +            pool = [(elem[0], [p for p in elem[1] if p != pipe.plane]) for elem in pool[:-1]]
> +
> +        # Create a framebuffer big enough for all connectors.
> +        fb = pykms.DumbFramebuffer(self.card, max_hdisplay, max_vdisplay, "XR24")
> +        pykms.draw_test_pattern(fb)
> +
> +        self.start("Moving connector %s between CRTCs %s" % \
> +                   (shared_connector.fullname, [pipe.crtc.id for pipe in pipes]))
> +
> +        self.logger.log("Highest display resolution: %ux%u" % (max_hdisplay, max_vdisplay))
> +
> +        for master_pipe in pipes:
> +            req = kmstest.AtomicRequest(self)
> +            connectors = self.allocate_connectors(pipes, master_pipe, shared_connector)
> +            route = []
> +
> +            for pipe in pipes:
> +                if pipe.connector and not pipe.connector in connectors.values():
> +                    req.add(pipe.connector, 'CRTC_ID', 0)
> +
> +                pipe.connector = connectors[pipe.crtc]
> +                mode = pipe.connector.get_default_mode()
> +                pipe.mode_blob = mode.to_blob(self.card)
> +
> +                req.add(pipe.connector, 'CRTC_ID', pipe.crtc.id)
> +                req.add(pipe.crtc, {'ACTIVE': 1, 'MODE_ID': pipe.mode_blob.id})
> +                req.add(pipe.plane, {
> +                            'FB_ID': fb.id,
> +                            'CRTC_ID': pipe.crtc.id,
> +                            'SRC_X': 0,
> +                            'SRC_Y': 0,
> +                            'SRC_W': int(mode.hdisplay * 65536),
> +                            'SRC_H': int(mode.vdisplay * 65536),
> +                            'CRTC_X': 0,
> +                            'CRTC_Y': 0,
> +                            'CRTC_W': mode.hdisplay,
> +                            'CRTC_H': mode.vdisplay,
> +                        })
> +
> +                route.append("CRTC %u to connector %s" % (pipe.crtc.id, pipe.connector.fullname))
> +
> +            self.logger.log("Routing " + ", ".join(route))
> +
> +            ret = req.commit_sync(True)
> +            if ret < 0:
> +                self.fail("atomic commit failed with %d" % ret)
> +                return
> +
> +            time.sleep(5)
> +
> +        self.success()
> +
> +        for pipe in pipes:
> +            self.atomic_crtc_disable(pipe.crtc)
> +
> +
> +    def allocate_connectors(self, pipes, master_pipe, shared_connector):
> +        # Allocate one connector for each CRTC. Create a pool of available
> +        # connectors for each CRTC, sorted by the number of connectors, and
> +        # allocate started with the CRTC that has the least number of options.
> +        # The master CRTC is always given the shared connector.
> +        pool = []
> +        for pipe in pipes:
> +            if pipe == master_pipe:
> +                pool.append((pipe.crtc, [shared_connector]))
> +                continue
> +
> +            pool.append((pipe.crtc, list(self.crtc_to_connectors[pipe.crtc])))
> +
> +        allocated = {}
> +        while len(pool):
> +            pool.sort(key=lambda elem: len(elem[1]), reverse=True)
> +            crtc, connectors = pool[-1]
> +
> +            connector = connectors[0]
> +            allocated[crtc] = connector
> +
> +            # Remove the selected connector from all elements in the pool
> +            pool = [(elem[0], [c for c in elem[1] if c != connector]) for elem in pool[:-1]]
> +
> +        return allocated
> +
> +
> +RoutingTest().execute()
> 

-- 
Regards
--
Kieran
