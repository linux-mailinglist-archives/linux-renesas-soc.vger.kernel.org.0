Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B569F49150
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 22:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbfFQU0c (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 16:26:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38676 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726614AbfFQU0c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 16:26:32 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D2692AF;
        Mon, 17 Jun 2019 22:26:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560803190;
        bh=HbjYDZeS0qkDPsH5ZRzc/UZoQBGVX3kG7qHM7adfNmQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ftDyG7zU8TMH7pMj5xwCGFCji3TNTmMwFQWr5bsZWnkPB+qdFZV7QiqSR6c6mqW2D
         VxcNZNg6Qkjilzuw/czwjLmeZWH6ITfT4XUAhQuvAZ1GAj31TU5IV53zo+hjUUIMUu
         2EHYJP6uN/fUf7MJ0HVXfN1P+1y0dNZraoL6Sz1c=
Date:   Mon, 17 Jun 2019 23:26:13 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [kms-tests] [PATCH] tests: Extend BRU/BRS allocation test to
 cover M3-N
Message-ID: <20190617202613.GD4777@pendragon.ideasonboard.com>
References: <20190617003536.30936-1-laurent.pinchart@ideasonboard.com>
 <1786bf7c-e9e0-709e-d0a9-d5e62e41bceb@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1786bf7c-e9e0-709e-d0a9-d5e62e41bceb@cogentembedded.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergei,

On Mon, Jun 17, 2019 at 11:29:52AM +0300, Sergei Shtylyov wrote:
> On 17.06.2019 3:35, Laurent Pinchart wrote:
> 
> > The BRU/BRS allocation test only covers the H3 ES2.0 SoC as that was the
> > only hardware platform supported by the DU driver that offered the
> > required features at the time the test was written. Now that M3-N is
> > supported in the DU driver, support it in the test script.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >   tests/kms-test-brxalloc.py | 7 +++----
> >   1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/tests/kms-test-brxalloc.py b/tests/kms-test-brxalloc.py
> > index 2e3f6cb8b39e..f1902f3baf1d 100755
> > --- a/tests/kms-test-brxalloc.py
> > +++ b/tests/kms-test-brxalloc.py
> > @@ -17,11 +17,10 @@ class BRxAllocTest(kmstest.KMSTest):
> >       def main(self):
> >           # This test requires usage of two CRTCs connected to the same VSPDL
> >           # instance to test dynamic assignment of the BRU and BRS to pipelines.
> > -        # This is only occurs on H3 ES2.0 (and M3N which we don't support yet).
> > -        # Check the SoC model through sysfs as we can't detected it through the
> > -        # DRM/KMS API.
> > +        # This is only occurs on H3 ES2.0 and M3N. Check the SoC model through
> 
>     Not M3-N?

Of course. I'll fix it.

> 
> [...]

-- 
Regards,

Laurent Pinchart
