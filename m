Return-Path: <linux-renesas-soc+bounces-1331-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2248C82528D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 12:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C87D91F238BA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 11:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEDE625565;
	Fri,  5 Jan 2024 11:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bPlBr/za"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901BF28E10;
	Fri,  5 Jan 2024 11:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127FBC433C8;
	Fri,  5 Jan 2024 11:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704452862;
	bh=5LBHi90ycZGiBugaaJZ3621DJtcCn8JxAX8QUU0Er2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bPlBr/za2PMpZlV43PYNkqjshmo21C4yBR6TDndpxuWaLEtbR4OQkONPKvfo8Lo6f
	 5h/dB6ZUvXCVUb74TepO72+jP1nkaz7f5y/+LWB4qfGv6A/lR3Z4CSW89LjzZwSM6a
	 fJpDlLltla85vv3UujYqQSX0Ed3DzeLL73wrB5+bP+SrNYCaws75+Dz6vTTLo+cb2F
	 zSpoVdkY2qhkdy523OZIs6aEzHrZXUTZNzfhD807C/pKseiyvSHqsAUA6G2tWhoZjv
	 3oIYPOs8F2gYRriG3GJO2fWjqL2jfc3b5pe18f0i87IvJKGRroEXodeE1EfXfhqtRJ
	 G1jHRFFWBBHCA==
Date: Fri, 5 Jan 2024 11:07:38 +0000
From: Simon Horman <horms@kernel.org>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH net] MAINTAINERS: I don't want to review Renesas Ethernet
 Switch driver
Message-ID: <20240105110738.GV31813@kernel.org>
References: <6498e2dd-7960-daeb-acce-a8d2207f3404@omp.ru>
 <20240103212822.GA48301@kernel.org>
 <8f9b5376-647a-7b59-886c-142990b8c9e4@omp.ru>
 <TYBPR01MB5341F4C4340200CABBFF5C05D8662@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <ef96eb69-636c-a91c-e7b7-46b02241ad0d@omp.ru>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef96eb69-636c-a91c-e7b7-46b02241ad0d@omp.ru>

On Fri, Jan 05, 2024 at 01:46:32PM +0300, Sergey Shtylyov wrote:
> On 1/5/24 5:42 AM, Yoshihiro Shimoda wrote:
> [...]
> 
> >>>> I don't know this hardware, I don't have the manuals for it, so I can't
> >>>> provide a good review.  Let's exclude the Ethernet Switch related files.
> >>>>
> >>>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> >>>
> >>> Hi Sergey,
> >>
> >>   Hi Simon, long time, no see... :-)
> >>
> >>> I don't know the back story to this, if there is one.
> >>
> >>    Not much of a history: I got a lot of the rswitch patches in my
> >> inbox and I mostly ignored them... but kept deferring this patch due
> >> to a high load with fixing Svace's reports at work...
> >>
> >>> But could I suggest that:
> >>>
> >>> 1. The patch also updates the title MAINTAINERS section to cover the
> >>>    remaining two drivers.
> >>>
> >>>    e.g.: RENESAS ETHERNET DRIVERS ->
> >>>          RENESAS ETHERNET AVB AND SUPERH ETHERNET DRIVERS
> >>>
> >>>    Or alternatively, create separate sections for each driver.
> >>
> >>    Yeah, this 2nd option seems cleaner. Still not sure about Kconfig/
> >> Makefile though...
> > 
> > How about adding "COMMON PARTS" section?
> > 
> > - RENESAS ETHERNET AVB AND SUPERH ETHERNET DRIVERS : For ravb and sh_eth
> > - RENESAS ETHERNET DRIVERS (COMMON PARTS) : For Kconfig/Makefile in drivers/net/ethernet/renesas
> > - RENESAS ETHERNET SWITCH DRIVER : For rswitch
> 
>    No, this seems too much for these poor little couple files. :-)
> Listing them in each new MAINTAINERS entry should achieve the same goal
> and seems a biut cleaner...
> 
> >>>    n.b.: This may involve moving sections to maintain alphabetical order
> >>>          by section title
> >>>
> >>> 2. Reaching out to Shimoda-san (CCed) or other relevant parties
> >>>    to see if an appropriate maintainer or maintainers for the
> >>>    Renesas Ethernet Switch driver can be found.
> > 
> > I'm happy if I'm a maintainer for Renesas Ethernet Switch driver.
> 
>    Do you want to be a maintainer or just a reviewer (like me)?

FWIIW, either option is fine by me.

> 
> > So, if my idea above is acceptable, perhaps the maintainers can be:
> > 
> > - RENESAS ETHERNET AVB AND SUPERH ETHERNET DRIVERS : Sergey
> 
>    There will be separate entries for those...
> 
> > - RENESAS ETHERNET DRIVERS (COMMON PARTS) : Sergey and Shimoda
> 
>    I'd like to avoid that... :-)
> 
> > - RENESAS ETHERNET SWITCH DRIVER : Shimoda
> 
> >>>    n.b.: It may still be a holiday period in Japan for the rest of the week.
> >>
> >>    It's a holiday period here in Russia as well, till the 8th of Jaunary. :-)
> > 
> > I'm back from today, but next Monday (8th) is a holiday in Japan :)
> 
>    You're back for 1 day? :-)
> 
> > Best regards,
> > Yoshihiro Shimoda
> > 
> >>> 3. Rephrase the subject and patch description as splitting out maintenance of
> >>>    the Renesas Ethernet Switch driver .
> 
>    The question that remains still unaddressed: should I do the MAINTAINERS
> "directory split" with a single patch?

That seems easiest to me.

> 
> [...]
> 
> MBR, Sergey

