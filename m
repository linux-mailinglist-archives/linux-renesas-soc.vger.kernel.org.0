Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D963E4B461
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 10:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731334AbfFSIur (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 04:50:47 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36598 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730783AbfFSIuq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 04:50:46 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECC2E333;
        Wed, 19 Jun 2019 10:50:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560934244;
        bh=grUQdKmXKHJyynfnRoCNieEf9DklrOouZZMUNQY5dzk=;
        h=Reply-To:Subject:To:References:From:Date:In-Reply-To:From;
        b=i4RuO4uPK72JoWxT/TjxT5K6WyEvIx2nk9SPBkdwdpN1HS06LzlUYQsVhQ3Xg00y7
         HL9Ob46HpXJHhMuL0PtEt2M8raunXIl8NdcPARmzfIctXcJFkWv3QKZxxAF7BAq1SJ
         7tiqSBx8/f7AnBJmmXP/kCyn3JE8MTHANvmwktSY=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [kms-tests] [PATCH] kmstest.py: Add output_connectors() helper to
 skip writeback connectors
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
References: <20190619002231.8239-1-laurent.pinchart@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 mQINBFYE/WYBEACs1PwjMD9rgCu1hlIiUA1AXR4rv2v+BCLUq//vrX5S5bjzxKAryRf0uHat
 V/zwz6hiDrZuHUACDB7X8OaQcwhLaVlq6byfoBr25+hbZG7G3+5EUl9cQ7dQEdvNj6V6y/SC
 rRanWfelwQThCHckbobWiQJfK9n7rYNcPMq9B8e9F020LFH7Kj6YmO95ewJGgLm+idg1Kb3C
 potzWkXc1xmPzcQ1fvQMOfMwdS+4SNw4rY9f07Xb2K99rjMwZVDgESKIzhsDB5GY465sCsiQ
 cSAZRxqE49RTBq2+EQsbrQpIc8XiffAB8qexh5/QPzCmR4kJgCGeHIXBtgRj+nIkCJPZvZtf
 Kr2EAbc6tgg6DkAEHJb+1okosV09+0+TXywYvtEop/WUOWQ+zo+Y/OBd+8Ptgt1pDRyOBzL8
 RXa8ZqRf0Mwg75D+dKntZeJHzPRJyrlfQokngAAs4PaFt6UfS+ypMAF37T6CeDArQC41V3ko
 lPn1yMsVD0p+6i3DPvA/GPIksDC4owjnzVX9kM8Zc5Cx+XoAN0w5Eqo4t6qEVbuettxx55gq
 8K8FieAjgjMSxngo/HST8TpFeqI5nVeq0/lqtBRQKumuIqDg+Bkr4L1V/PSB6XgQcOdhtd36
 Oe9X9dXB8YSNt7VjOcO7BTmFn/Z8r92mSAfHXpb07YJWJosQOQARAQABtDBLaWVyYW4gQmlu
 Z2hhbSA8a2llcmFuLmJpbmdoYW1AaWRlYXNvbmJvYXJkLmNvbT6JAkAEEwEKACoCGwMFCwkI
 BwIGFQgJCgsCBBYCAwECHgECF4ACGQEFAlnDk/gFCQeA/YsACgkQoR5GchCkYf3X5w/9EaZ7
 cnUcT6dxjxrcmmMnfFPoQA1iQXr/MXQJBjFWfxRUWYzjvUJb2D/FpA8FY7y+vksoJP7pWDL7
 QTbksdwzagUEk7CU45iLWL/CZ/knYhj1I/+5LSLFmvZ/5Gf5xn2ZCsmg7C0MdW/GbJ8IjWA8
 /LKJSEYH8tefoiG6+9xSNp1p0Gesu3vhje/GdGX4wDsfAxx1rIYDYVoX4bDM+uBUQh7sQox/
 R1bS0AaVJzPNcjeC14MS226mQRUaUPc9250aj44WmDfcg44/kMsoLFEmQo2II9aOlxUDJ+x1
 xohGbh9mgBoVawMO3RMBihcEjo/8ytW6v7xSF+xP4Oc+HOn7qebAkxhSWcRxQVaQYw3S9iZz
 2iA09AXAkbvPKuMSXi4uau5daXStfBnmOfalG0j+9Y6hOFjz5j0XzaoF6Pln0jisDtWltYhP
 X9LjFVhhLkTzPZB/xOeWGmsG4gv2V2ExbU3uAmb7t1VSD9+IO3Km4FtnYOKBWlxwEd8qOFpS
 jEqMXURKOiJvnw3OXe9MqG19XdeENA1KyhK5rqjpwdvPGfSn2V+SlsdJA0DFsobUScD9qXQw
 OvhapHe3XboK2+Rd7L+g/9Ud7ZKLQHAsMBXOVJbufA1AT+IaOt0ugMcFkAR5UbBg5+dZUYJj
 1QbPQcGmM3wfvuaWV5+SlJ+WeKIb8ta5Ag0EVgT9ZgEQAM4o5G/kmruIQJ3K9SYzmPishRHV
 DcUcvoakyXSX2mIoccmo9BHtD9MxIt+QmxOpYFNFM7YofX4lG0ld8H7FqoNVLd/+a0yru5Cx
 adeZBe3qr1eLns10Q90LuMo7/6zJhCW2w+HE7xgmCHejAwuNe3+7yt4QmwlSGUqdxl8cgtS1
 PlEK93xXDsgsJj/bw1EfSVdAUqhx8UQ3aVFxNug5OpoX9FdWJLKROUrfNeBE16RLrNrq2ROc
 iSFETpVjyC/oZtzRFnwD9Or7EFMi76/xrWzk+/b15RJ9WrpXGMrttHUUcYZEOoiC2lEXMSAF
 SSSj4vHbKDJ0vKQdEFtdgB1roqzxdIOg4rlHz5qwOTynueiBpaZI3PHDudZSMR5Fk6QjFooE
 XTw3sSl/km/lvUFiv9CYyHOLdygWohvDuMkV/Jpdkfq8XwFSjOle+vT/4VqERnYFDIGBxaRx
 koBLfNDiiuR3lD8tnJ4A1F88K6ojOUs+jndKsOaQpDZV6iNFv8IaNIklTPvPkZsmNDhJMRHH
 Iu60S7BpzNeQeT4yyY4dX9lC2JL/LOEpw8DGf5BNOP1KgjCvyp1/KcFxDAo89IeqljaRsCdP
 7WCIECWYem6pLwaw6IAL7oX+tEqIMPph/G/jwZcdS6Hkyt/esHPuHNwX4guqTbVEuRqbDzDI
 2DJO5FbxABEBAAGJAiUEGAEKAA8CGwwFAlnDlGsFCQeA/gIACgkQoR5GchCkYf1yYRAAq+Yo
 nbf9DGdK1kTAm2RTFg+w9oOp2Xjqfhds2PAhFFvrHQg1XfQR/UF/SjeUmaOmLSczM0s6XMeO
 VcE77UFtJ/+hLo4PRFKm5X1Pcar6g5m4xGqa+Xfzi9tRkwC29KMCoQOag1BhHChgqYaUH3yo
 UzaPwT/fY75iVI+yD0ih/e6j8qYvP8pvGwMQfrmN9YB0zB39YzCSdaUaNrWGD3iCBxg6lwSO
 LKeRhxxfiXCIYEf3vwOsP3YMx2JkD5doseXmWBGW1U0T/oJF+DVfKB6mv5UfsTzpVhJRgee7
 4jkjqFq4qsUGxcvF2xtRkfHFpZDbRgRlVmiWkqDkT4qMA+4q1y/dWwshSKi/uwVZNycuLsz+
 +OD8xPNCsMTqeUkAKfbD8xW4LCay3r/dD2ckoxRxtMD9eOAyu5wYzo/ydIPTh1QEj9SYyvp8
 O0g6CpxEwyHUQtF5oh15O018z3ZLztFJKR3RD42VKVsrnNDKnoY0f4U0z7eJv2NeF8xHMuiU
 RCIzqxX1GVYaNkKTnb/Qja8hnYnkUzY1Lc+OtwiGmXTwYsPZjjAaDX35J/RSKAoy5wGo/YFA
 JxB1gWThL4kOTbsqqXj9GLcyOImkW0lJGGR3o/fV91Zh63S5TKnf2YGGGzxki+ADdxVQAm+Q
 sbsRB8KNNvVXBOVNwko86rQqF9drZuw=
Organization: Ideas on Board
Message-ID: <0e9a29fe-9058-ebcb-4256-ff417bd43a83@ideasonboard.com>
Date:   Wed, 19 Jun 2019 09:50:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190619002231.8239-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 19/06/2019 01:22, Laurent Pinchart wrote:
> Add a generator method to the KMSTest class to enumerate all
> non-writeback connectors, and use it through tests.
> 

Excellent, yes that's exactly what I had in mind.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  tests/kms-test-allplanes.py      |  2 +-
>  tests/kms-test-brxalloc.py       |  2 +-
>  tests/kms-test-crc.py            |  2 +-
>  tests/kms-test-formats.py        |  2 +-
>  tests/kms-test-legacy-modeset.py |  2 +-
>  tests/kms-test-modes.py          |  2 +-
>  tests/kms-test-modeset.py        |  2 +-
>  tests/kms-test-pageflip.py       |  2 +-
>  tests/kms-test-planeposition.py  |  2 +-
>  tests/kms-test-routing.py        | 10 ++--------
>  tests/kmstest.py                 |  6 ++++++
>  11 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/tests/kms-test-allplanes.py b/tests/kms-test-allplanes.py
> index f416723bc7fc..ca7baa07af42 100755
> --- a/tests/kms-test-allplanes.py
> +++ b/tests/kms-test-allplanes.py
> @@ -12,7 +12,7 @@ class AllPlanesTest(kmstest.KMSTest):
>      def main(self):
>          # Create the connectors to CRTCs map
>          connectors = {}
> -        for connector in self.card.connectors:
> +        for connector in self.output_connectors():
>              # Skip disconnected connectors
>              if not connector.connected():
>                  continue
> diff --git a/tests/kms-test-brxalloc.py b/tests/kms-test-brxalloc.py
> index e6d9f03fc211..a0ae46a8b53e 100755
> --- a/tests/kms-test-brxalloc.py
> +++ b/tests/kms-test-brxalloc.py
> @@ -44,7 +44,7 @@ class BRxAllocTest(kmstest.KMSTest):
>                          (len(planes), outputs[0].crtc.id, outputs[1].crtc.id))
>  
>          # Get one connector for each CRTC
> -        for connector in self.card.connectors:
> +        for connector in self.output_connectors():
>              # Skip disconnected connectors
>              if not connector.connected():
>                  continue
> diff --git a/tests/kms-test-crc.py b/tests/kms-test-crc.py
> index 29147e5bd0a3..e0e0eabd9950 100755
> --- a/tests/kms-test-crc.py
> +++ b/tests/kms-test-crc.py
> @@ -12,7 +12,7 @@ class CRCTest(kmstest.KMSTest):
>      def main(self):
>          # Create the connectors to CRTCs map
>          connectors = {}
> -        for connector in self.card.connectors:
> +        for connector in self.output_connectors():
>              # Skip disconnected connectors
>              if not connector.connected():
>                  continue
> diff --git a/tests/kms-test-formats.py b/tests/kms-test-formats.py
> index ae89bb542485..15e6f591aea9 100755
> --- a/tests/kms-test-formats.py
> +++ b/tests/kms-test-formats.py
> @@ -11,7 +11,7 @@ class FormatsTest(kmstest.KMSTest):
>          self.start("plane formats")
>  
>          # Find a CRTC with a connected connector and at least one plane
> -        for connector in self.card.connectors:
> +        for connector in self.output_connectors():
>              if not connector.connected():
>                  self.skip("unconnected connector")
>                  continue
> diff --git a/tests/kms-test-legacy-modeset.py b/tests/kms-test-legacy-modeset.py
> index eac365f44b64..17a81792a2b8 100755
> --- a/tests/kms-test-legacy-modeset.py
> +++ b/tests/kms-test-legacy-modeset.py
> @@ -10,7 +10,7 @@ class LegacyModeSetTest(kmstest.KMSTest):
>          self.logger.log("Page flip complete")
>  
>      def main(self):
> -        for connector in self.card.connectors:
> +        for connector in self.output_connectors():
>              self.start("legacy mode set on connector %s" % connector.fullname)
>  
>              # Skip disconnected connectors
> diff --git a/tests/kms-test-modes.py b/tests/kms-test-modes.py
> index 2ca45c46b50d..82a1a3b21e93 100755
> --- a/tests/kms-test-modes.py
> +++ b/tests/kms-test-modes.py
> @@ -30,7 +30,7 @@ class ModesTest(kmstest.KMSTest):
>              raise RuntimeError("Page flip not registered")
>  
>      def main(self):
> -        for connector in self.card.connectors:
> +        for connector in self.output_connectors():
>              self.start("modes on connector %s" % connector.fullname)
>  
>              # Skip disconnected connectors
> diff --git a/tests/kms-test-modeset.py b/tests/kms-test-modeset.py
> index f8a78ad2926b..224b39143a8e 100755
> --- a/tests/kms-test-modeset.py
> +++ b/tests/kms-test-modeset.py
> @@ -10,7 +10,7 @@ class ModeSetTest(kmstest.KMSTest):
>          self.logger.log("Page flip complete")
>  
>      def main(self):
> -        for connector in self.card.connectors:
> +        for connector in self.output_connectors():
>              self.start("atomic mode set on connector %s" % connector.fullname)
>  
>              # Skip disconnected connectors
> diff --git a/tests/kms-test-pageflip.py b/tests/kms-test-pageflip.py
> index 2aeaf3478dc3..bef1f4990a10 100755
> --- a/tests/kms-test-pageflip.py
> +++ b/tests/kms-test-pageflip.py
> @@ -40,7 +40,7 @@ class PageFlipTest(kmstest.KMSTest):
>          self.stop_requested = True
>  
>      def main(self):
> -        for connector in self.card.connectors:
> +        for connector in self.output_connectors():
>              self.start("page flip on connector %s" % connector.fullname)
>  
>              # Skip disconnected connectors
> diff --git a/tests/kms-test-planeposition.py b/tests/kms-test-planeposition.py
> index 63f745b5dbed..ac4b4d0eb407 100755
> --- a/tests/kms-test-planeposition.py
> +++ b/tests/kms-test-planeposition.py
> @@ -11,7 +11,7 @@ class PlanePositionTest(kmstest.KMSTest):
>          self.start("plane positioning boundaries")
>  
>          # Find a CRTC with a connected connector and at least two planes
> -        for connector in self.card.connectors:
> +        for connector in self.output_connectors():
>              if not connector.connected():
>                  self.skip("unconnected connector")
>                  continue
> diff --git a/tests/kms-test-routing.py b/tests/kms-test-routing.py
> index 2cf02ddcc6b5..a24dc1c0fb1e 100755
> --- a/tests/kms-test-routing.py
> +++ b/tests/kms-test-routing.py
> @@ -23,10 +23,7 @@ class RoutingTest(kmstest.KMSTest):
>          max_hdisplay = 0
>          max_vdisplay = 0
>  
> -        for connector in self.card.connectors:
> -            if connector.fullname.startswith('writeback-'):
> -                continue
> -
> +        for connector in self.output_connectors():
>              mode = connector.get_default_mode()
>              max_hdisplay = max(mode.hdisplay, max_hdisplay)
>              max_vdisplay = max(mode.vdisplay, max_vdisplay)
> @@ -39,10 +36,7 @@ class RoutingTest(kmstest.KMSTest):
>          # Find a connector that can be routed to at least two CRTCs that have
>          # at least two output routes each.
>          shared_connector = None
> -        for connector in self.card.connectors:
> -            if connector.fullname.startswith('writeback-'):
> -                continue
> -
> +        for connector in self.output_connectors():
>              pipes = []
>              for crtc in connector.get_possible_crtcs():
>                  if len(self.crtc_to_connectors[crtc]) >= 2:
> diff --git a/tests/kmstest.py b/tests/kmstest.py
> index 336e31a55d47..8a483d7b5259 100755
> --- a/tests/kmstest.py
> +++ b/tests/kmstest.py
> @@ -364,6 +364,12 @@ class KMSTest(object):
>          else:
>              return req.commit(0)
>  
> +    def output_connectors(self):
> +        for connector in self.card.connectors:
> +            if connector.fullname.startswith('writeback-'):
> +                continue
> +            yield connector
> +
>      def __handle_page_flip(self, frame, time):
>          self.flips += 1
>          try:
> 

-- 
Regards
--
Kieran
