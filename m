Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6741511DA2D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2019 00:45:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730992AbfLLXpr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Dec 2019 18:45:47 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56608 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbfLLXpq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Dec 2019 18:45:46 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB8E1A2B;
        Fri, 13 Dec 2019 00:45:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576194345;
        bh=QrBWnyTjIgGtIHd54rLRgGsB9UVjOujhve/5jyQMnF0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=DCfC7LvlgtlBWbw41qul6nOEJCrMfohUsDKnNwLZOSmkfprewzRPOwcafk6G0jC2x
         mVgzb6NpmB+ml5uYdCONmbJeigoO6CC9yqSLR/+EjiXdtV9Ck3iK3jty2ofiK6UTj6
         JFl5LFZrbDl3+DR3uhq32E2zGjPO+FAmjg1XrNXw=
Date:   Fri, 13 Dec 2019 01:45:35 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] yavta: Fix usage documentation for --field option
Message-ID: <20191212234535.GF4892@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWgkFiCbibrxUTOYPCFF+faJhacTEbF0LHA0gDpNA+_Jw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Tue, Dec 10, 2019 at 09:18:37AM +0100, Geert Uytterhoeven wrote:
> On Mon, Dec 9, 2019 at 10:23 PM Niklas Söderlund wrote:
> > The --field option takes an argument selecting the field order. Update
> > the usage text to reflect this.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  yavta.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/yavta.c b/yavta.c
> > index f83e143c051396c4..196345c323c662d3 100644
> > --- a/yavta.c
> > +++ b/yavta.c
> > @@ -2286,7 +2286,7 @@ static void usage(const char *argv0)
> >         printf("    --enum-formats              Enumerate formats\n");
> >         printf("    --enum-inputs               Enumerate inputs\n");
> >         printf("    --fd                        Use a numeric file descriptor insted of a device\n");
> > -       printf("    --field                     Interlaced format field order\n");
> > +       printf("    --field field               Set the format field order\n");
> 
> "Valid values for field are ..."?

Please let me know if you want to send a v2. yavta is a low-level tool
so I don't think this is critical, users are expected to know that the
value comes from the V4L2 API, but stating hit wouldn't hurt either.

> >         printf("    --log-status                Log device status\n");
> >         printf("    --no-query                  Don't query capabilities on open\n");
> >         printf("    --offset                    User pointer buffer offset from page start\n");

-- 
Regards,

Laurent Pinchart
