Return-Path: <linux-renesas-soc+bounces-1325-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2617E825141
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 10:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6710284A70
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 09:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B17249F7;
	Fri,  5 Jan 2024 09:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jhxIVMs4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616542377E;
	Fri,  5 Jan 2024 09:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A8DC433C8;
	Fri,  5 Jan 2024 09:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704448449;
	bh=Q3++BYkXZTDLMuoxfoR51GqwhiF3CPpgmZlQRvO2s3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jhxIVMs4sbwEQmRjPAggVHXlGggOwyozFmukxqlcFA7UP6BCcJKevnKQMUQGh8ba7
	 u3jfC63/75dQadsEZ3MPTJcmCP9Y8yg8CqkLMsviRCEQ7TWFtV4K0+L/1arNpPNtCi
	 vetodr7e5SjmL+gCUYF8hJ1jOh75q22xDEuegv/GqemAWnjupVYzLBfTlMkeVa0AnN
	 q0KAG74QOUOOc5ftl4Y1lpxceorZ1prCgvTRCWCuOCSF8f7oF31BEHhE9queVxCUjB
	 5l3k7yF6Ctm2Qrgnaq29rPTC5Qk5DhxhMIG+9FFaKuriQmUddM8bhhK2L7Mft5eWHG
	 6la1nqbf6av5w==
Date: Fri, 5 Jan 2024 09:54:06 +0000
From: Simon Horman <horms@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH net] MAINTAINERS: I don't want to review Renesas Ethernet
 Switch driver
Message-ID: <20240105095406.GQ31813@kernel.org>
References: <6498e2dd-7960-daeb-acce-a8d2207f3404@omp.ru>
 <20240103212822.GA48301@kernel.org>
 <8f9b5376-647a-7b59-886c-142990b8c9e4@omp.ru>
 <TYBPR01MB5341F4C4340200CABBFF5C05D8662@TYBPR01MB5341.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYBPR01MB5341F4C4340200CABBFF5C05D8662@TYBPR01MB5341.jpnprd01.prod.outlook.com>

On Fri, Jan 05, 2024 at 02:42:54AM +0000, Yoshihiro Shimoda wrote:
> Hello,
> 
> Thank you for adding CC to me.

Likewise, thanks for your response.

> > From: Sergey Shtylyov, Sent: Friday, January 5, 2024 5:47 AM
> > 
> > On 1/4/24 12:28 AM, Simon Horman wrote:
> > [...]
> > >> I don't know this hardware, I don't have the manuals for it, so I can't
> > >> provide a good review.  Let's exclude the Ethernet Switch related files.
> > >>
> > >> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> > >
> > > Hi Sergey,
> > 
> >   Hi Simon, long time, no see... :-)
> > 
> > > I don't know the back story to this, if there is one.
> > 
> >    Not much of a history: I got a lot of the rswitch patches in my
> > inbox and I mostly ignored them... but kept deferring this patch due
> > to a high load with fixing Svace's reports at work...
> > 
> > > But could I suggest that:
> > >
> > > 1. The patch also updates the title MAINTAINERS section to cover the
> > >    remaining two drivers.
> > >
> > >    e.g.: RENESAS ETHERNET DRIVERS ->
> > >          RENESAS ETHERNET AVB AND SUPERH ETHERNET DRIVERS
> > >
> > >    Or alternatively, create separate sections for each driver.
> > 
> >    Yeah, this 2nd option seems cleaner. Still not sure about Kconfig/
> > Makefile though...
> 
> How about adding "COMMON PARTS" section?

I think that would be fine.

> - RENESAS ETHERNET AVB AND SUPERH ETHERNET DRIVERS : For ravb and sh_eth

I think Sergey prefers two sections for the above.
Perhaps:

  - RENESAS ETHERNET AVB DRIVER
  - RENESAS SUPERH ETHERNET DRIVER

Whoever drafts the patch, please be sure to maintain
alphabetical order by section title.

> - RENESAS ETHERNET DRIVERS (COMMON PARTS) : For Kconfig/Makefile in drivers/net/ethernet/renesas
> - RENESAS ETHERNET SWITCH DRIVER : For rswitch
> 
> > >    n.b.: This may involve moving sections to maintain alphabetical order
> > >          by section title
> > >
> > > 2. Reaching out to Shimoda-san (CCed) or other relevant parties
> > >    to see if an appropriate maintainer or maintainers for the
> > >    Renesas Ethernet Switch driver can be found.
> 
> I'm happy if I'm a maintainer for Renesas Ethernet Switch driver.
> So, if my idea above is acceptable, perhaps the maintainers can be:
> 
> - RENESAS ETHERNET AVB AND SUPERH ETHERNET DRIVERS : Sergey
> - RENESAS ETHERNET DRIVERS (COMMON PARTS) : Sergey and Shimoda
> - RENESAS ETHERNET SWITCH DRIVER : Shimoda

Modulo my comments above, this sounds reasonable to me.

> > >    n.b.: It may still be a holiday period in Japan for the rest of the week.
> > 
> >    It's a holiday period here in Russia as well, till the 8th of Jaunary. :-)
> 
> I'm back from today, but next Monday (8th) is a holiday in Japan :)

Enjoy.

> 
> Best regards,
> Yoshihiro Shimoda
> 
> > > 3. Rephrase the subject and patch description as splitting out maintenance of
> > >    the Renesas Ethernet Switch driver .
> > 
> > [...]
> > 
> > MBR, Sergey

