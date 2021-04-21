Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8845B36676A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Apr 2021 10:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235313AbhDUI7U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Apr 2021 04:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237696AbhDUI7U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Apr 2021 04:59:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A7C9C06138E
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Apr 2021 01:58:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A33733EE;
        Wed, 21 Apr 2021 10:58:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618995523;
        bh=aVbrhdmiFJvT0J6vZYCv1W76rZatV9yY2iTen8ZjEek=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O6DPZO8o7MTp981Bn8+nHr/FVlItFYRMNAGqlM3l8k5gjQRh+anTdZIZerojzJscR
         E3uSZVuKi8Rv3EsZCMSmfI/5BMyNkm3q0Z951PIgHzPn6thF1A0A3nF6gb4rgYmE9A
         8JpJKUaFBw0b42X83IsHSkbP/ECcD5m4Q+OddLqs=
Date:   Wed, 21 Apr 2021 11:58:38 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] yavta: Fix usage documentation for --field option
Message-ID: <YH/pPirAniMbAAZ3@pendragon.ideasonboard.com>
References: <CAMuHMdWgkFiCbibrxUTOYPCFF+faJhacTEbF0LHA0gDpNA+_Jw@mail.gmail.com>
 <20191212234535.GF4892@pendragon.ideasonboard.com>
 <20191213010207.GD26038@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191213010207.GD26038@bigcity.dyn.berto.se>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Fri, Dec 13, 2019 at 02:02:07AM +0100, Niklas Söderlund wrote:
> On 2019-12-13 01:45:35 +0200, Laurent Pinchart wrote:
> > On Tue, Dec 10, 2019 at 09:18:37AM +0100, Geert Uytterhoeven wrote:
> > > On Mon, Dec 9, 2019 at 10:23 PM Niklas Söderlund wrote:
> > > > The --field option takes an argument selecting the field order. Update
> > > > the usage text to reflect this.
> > > >
> > > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > > ---
> > > >  yavta.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/yavta.c b/yavta.c
> > > > index f83e143c051396c4..196345c323c662d3 100644
> > > > --- a/yavta.c
> > > > +++ b/yavta.c
> > > > @@ -2286,7 +2286,7 @@ static void usage(const char *argv0)
> > > >         printf("    --enum-formats              Enumerate formats\n");
> > > >         printf("    --enum-inputs               Enumerate inputs\n");
> > > >         printf("    --fd                        Use a numeric file descriptor insted of a device\n");
> > > > -       printf("    --field                     Interlaced format field order\n");
> > > > +       printf("    --field field               Set the format field order\n");
> > > 
> > > "Valid values for field are ..."?
> > 
> > Please let me know if you want to send a v2. yavta is a low-level tool
> > so I don't think this is critical, users are expected to know that the
> > value comes from the V4L2 API, but stating hit wouldn't hurt either.
> 
> I'm open to send a v2 based out your feedback.
> 
> I was prompted to write this patch when writing a test for vin-tests for 
> TB/BT and I had to look in the yavta sources to find which strings yavta 
> used for the different field options and misinterpreting the help for 
> --field to only concern interlaced field formats.
> 
> As you state yavta is a low-level tool so I'm fine with the patch as is 
> just to demonstrate that the --field argument takes a value and is not 
> exclusive to interlaced formats or extend it similar to '--format help'.

Listing the supported values in the help text would be helpful I think.
As the number of possible values for the field is limited, I don't think
we need '--field help'. "Valid values for field are TB, BT, ..." should
be short enough.

> > > >         printf("    --log-status                Log device status\n");
> > > >         printf("    --no-query                  Don't query capabilities on open\n");
> > > >         printf("    --offset                    User pointer buffer offset from page start\n");

-- 
Regards,

Laurent Pinchart
