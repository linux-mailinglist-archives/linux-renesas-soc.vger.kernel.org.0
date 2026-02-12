Return-Path: <linux-renesas-soc+bounces-28165-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kALLFSlejWky1gAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28165-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Feb 2026 05:59:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD2012A56C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Feb 2026 05:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2DF72300C0CB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Feb 2026 04:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8AE82571A5;
	Thu, 12 Feb 2026 04:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r71Kt3KM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FB324503C;
	Thu, 12 Feb 2026 04:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770872356; cv=none; b=CPUk2gs5Rwg6g+4b01+9TL7rLGdMSTO47TkFBiJpMA9g4/XmAKwZMqyYalG4HsCLs57raQlM7foGpWNgIABlngI3a6tb+wOaQ6nk6LFHbNzEe55DEd4IHrLtuI1R22oZjgdJxFH6/Ozfu2FaDbzduiFhRCqV7hLPBe1Xht7nAbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770872356; c=relaxed/simple;
	bh=UnAdBLauz4b5Df5C+3yEl1YgYjyNNMVaiRJ8Yi+kh58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mr8nbu9TevgVEJva/KnK9PmRPXrv9qpQb1tAREltXp0Hsf6PLuj3fZuB0vhnG/iSYisOOcSz7xvDzhHtGNNRHEM8g3pVWoAvSloeScXGpUkpd95l/pqgLLeMDnTaIxuzwkBHApf2dcumexwv5iVX+/eeq6tgGUVr8eA+rPGBa5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r71Kt3KM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8AD6C19424;
	Thu, 12 Feb 2026 04:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770872356;
	bh=UnAdBLauz4b5Df5C+3yEl1YgYjyNNMVaiRJ8Yi+kh58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r71Kt3KMl5dacM2hd4zRiZPY9ASgouLClvQBczCm3QC9WC32MM0S8Hwc3BFNXel/z
	 8E85PQjPgucKv2aY0Qe1lRyBjf/0jHDOW4sjafOdjoEXg7L7DXqaHN5lLuYE2HNOuw
	 nev3+RaV1XqAQg3nfOWnJwOlfn1HvyBgcZzPkTHuQvKnC8iDBLj3EHxn1gIkujcl/I
	 t7cWKeP92BLzkj/focLbKecUoPXAlvtKipAKaDuJL2Y2IimbTH5m/RtYzQADtxEnno
	 U9JnjcQsnDCos36AnTjNk5L5gRPD8/gk9zt4TemhW1iePMfNclRwBdZXZsj36Wn0Ce
	 P6mVdDJufGYnw==
Date: Thu, 12 Feb 2026 10:29:12 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Josua Mayer <josua@solid-run.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH next] phy: renesas: rcar-gen3-usb2: Drop local
 devm_mux_state_get_optional()
Message-ID: <aY1eIG_U_GBOFQGt@vaman>
References: <67c8c4f9bf9f09fd0c13daedef27b82ff389ddfb.1770720452.git.geert+renesas@glider.be>
 <CAPDyKFpY2X8hephSfHq7rj_DaKX76ZSkWSCYXrGTEBUFHkvOzg@mail.gmail.com>
 <aYyrsPTH1923jV7y@vaman>
 <CAMuHMdUHNRuMmHU2ACX84nsZdXn_-fSamnF+LMFvZS3vkHnEWA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUHNRuMmHU2ACX84nsZdXn_-fSamnF+LMFvZS3vkHnEWA@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28165-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,renesas.com,solid-run.com,sang-engineering.com,bp.renesas.com,lists.infradead.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: DDD2012A56C
X-Rspamd-Action: no action

Hi Geert,

On 11-02-26, 17:30, Geert Uytterhoeven wrote:
> Hi Vinod,
> 
> On Wed, 11 Feb 2026 at 17:17, Vinod Koul <vkoul@kernel.org> wrote:
> > On 10-02-26, 14:34, Ulf Hansson wrote:
> > > On Tue, 10 Feb 2026 at 11:53, Geert Uytterhoeven
> > > <geert+renesas@glider.be> wrote:
> > > > Now the mux core provides devm_mux_state_get_optional():
> > > >
> > > >     drivers/phy/renesas/phy-rcar-gen3-usb2.c:944:1: error: static declaration of ‘devm_mux_state_get_optional’ follows non-static
> > > >      declaration
> > > >       944 | devm_mux_state_get_optional(struct device *dev, const char *mux_name)
> > > >           | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > >     In file included from drivers/phy/renesas/phy-rcar-gen3-usb2.c:20:
> > > >     include/linux/mux/consumer.h:64:19: note: previous declaration of ‘devm_mux_state_get_optional’ with type ‘struct mux_state *(struct device *, const char *)’
> > > >        64 | struct mux_state *devm_mux_state_get_optional(struct device *dev, const char *mux_name);
> > > >           |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > >
> > > > Fix this by dropping the temporary local wrapper.
> > > >
> > > > Fixes: ad314348ceb4fe1f ("mux: Add helper functions for getting optional and selected mux-state")
> > > > Fixes: 8bb92fd7a0407792 ("phy: renesas: rcar-gen3-usb2: Use mux-state for phyrst management")
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > Thanks Geert for helping out!
> > >
> > > > ---
> > > >   - ad314348ceb4fe1f is in mmc/next, and a PR has already been sent
> > > >     https://lore.kernel.org/20260209133441.556464-1-ulf.hansson@linaro.org
> > > >   - 8bb92fd7a0407792 is in phy/next
> > >
> > > Vinod, do you want to pick up the $subject patch as a fix for 7.0-rc1
> > > or do you prefer me to handle it?
> >
> > Should I drop the 8bb92fd7a0407792 and it makes things easier for
> > everyone and then we can pick fixed commit for 7.1 cycle..
> >
> > Does that work for everyone. I was about to send PR, will hold off for a
> > bit.
> 
> Alternatively, you can mention the semantic conflict in your PR to Linus,
> and ask him to fold my patch into the merge commit.

Hmmm, that is also a good option but might leave Linus a bit grumpy so
bit reluctant. Dropping and getting right implementation would be
better. I think it was a mistake to pick or this all could have gone
thru mux tree.

Thanks
-- 
~Vinod

