Return-Path: <linux-renesas-soc+bounces-32670-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EdwxGjDyBmpZpQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32670-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 12:15:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB6954D226
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 12:15:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03F4030C74DA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 09:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268E143D51B;
	Fri, 15 May 2026 09:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FF/EhAus"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8837743CEE4
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 09:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778838475; cv=none; b=VM1rF8njU+cI7qyKQC18/pCm0QgDVKqe14O8JGq+WP357jusQ5jmvKxqExY5xed0c9pDvrHJ0wwKy+S0A/GQkZqhVo/CmqhfjPs0H69uI2y7MN6GNh8U//8bKRjooTe8ZpB+rQsdguL6Xg6vybmiCGU1y4seo6c+RJyyCh3QJhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778838475; c=relaxed/simple;
	bh=YsVsPmo72PQUOPJu8nLHlVsqbrOYIiU0ZJsMqkQT5cw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UqB7uoRMdou6ei7yTUrjbfirMsYCM/QC4VeubCb7lmZM84a5laCmBCAQA+dH9Ewkfxr+QBVFUPRaBGMBT0XYeYFB4GoT3bLwfxnVhsMAZPeS/843JSzt003vdquJ/Trq5RKCfOGrlTmy/40AAMu4snsHdLalBi0Vbk/FDHHBZXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FF/EhAus; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so85019955e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 02:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778838472; x=1779443272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/e37VgLdpUmdJ/sT4E0Yd2dWN5tYEQahe7Aa4DMknc=;
        b=FF/EhAusbfNX+WLjmvp0pNGZzXUwJi/D/svXJaGzag5n9QC/6Btq65WszrmpgHP3Ci
         0Vi7bpinZTPoleXlWpLIa12LBLyAfu1Ggj4Q1jjExiXCZP58GlsRr9F/v2J+HXHagQ0I
         x5E+lvjZ9gCa4fL2AHs2SzXBvC+2K7JSsVOWQvTZSeakONRdhuH1SdyEshCzRVb5Onxq
         3DNCbnpl3HE/cE6Uv8AHRnYGrShOcCTt/eukhNqtjm6lBzUdKeFOa83M0szbx1fxG1R7
         +T9A3PwzNzEecAcaQHOZu4YYYvJ+Twkstu+M7Kj6Mh71sHKMrsPSCqIOBoxqfebv55XZ
         7RUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778838472; x=1779443272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r/e37VgLdpUmdJ/sT4E0Yd2dWN5tYEQahe7Aa4DMknc=;
        b=lQaw9dbdJHCsJ94aPGpPjV1SBt9beL8M1oeTISDGkkXGGfS8mQ1jEscG1OuxgAzJtg
         1n0ORvVZnF1VMas4sJjYk2YjzEnbG4v/bhFgNRNy07ym+wEw62VEAmsDC8pSf0T4bVTR
         uPBOYyKDiF5sB/NrrTliZZ2HKzutwcj/gWg7PqnWlckYiSfDLXyDSkJD9uiWB3EiWZh7
         Jtfb16rje8xg+15ok35JCfbSfr51FTbHKkxxm/wurE60O/mvWAIykZEvSAdBKQhlPlsu
         GiVtbUx/TuJrRCnKA16P3iZAbUlRB19NjtwnsBgMqPrtfanGPe5oSPaOR16sqleK1KbQ
         KuEw==
X-Forwarded-Encrypted: i=1; AFNElJ88AnxdEZs2Gq6bq2IvRL3ekrfs5s5hDOArIz5XlrkQXftvww8FM+1WaJS7gu50j4PIdN54c8aPIQ/BEyoYFjW3iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMaj1oEbHuA32BhnPICuObofmv5s80HdsLp88tg+GEwgowAZdk
	5xkuE2IiTNfdoCBJgmJA2dyMGKghznRPJQ8BgKUqmF5tldxK7uSc/vNi
X-Gm-Gg: Acq92OFVzkGBKmmK6q4409Qq5nwguUmTLRsQjfl/c5drpnJFTXkYf1Bp2oU2ZIGSz5e
	rNQb6OgZC6d7/FzLAc+1u1kN8DPl0jEqs8B8ET7eqHBGixMRYTX3jppaGxQHFyrI+OaWgabVaFC
	ZqQ79MCgfDx882lFoOq0zOUsZY/08ztmfi/grQ2OjoBSJbSHJDY4IlS6n/XIKYWsqilw1xSYYY5
	2C6zRl6MYPt25B0I41WgTw1kHeZ09KyokY6XywHkJwLK9wah50+14jipoTGyoo1iNLSxIk/xcJl
	pfasGdG0pkDEXozWLdr08CewgNzxk4iJ+Du/yk4PqzVJppyFxro/ZilAY02EnMuJxjP6nU5cfqP
	bqJSQd61Nk1Wqbtvm9wU9JJ0kvX7bTAOZrObtBhvnJJpYubMnbkxdEm2bAWlJh3whQiWW5cEmjI
	FL5N1vpglmsYK5PrbhtvV0Eu8GB4u9kvJ850CwFgNummh7ESDwGXThSTX0je7T
X-Received: by 2002:a05:600c:a4f:b0:48f:e230:2a24 with SMTP id 5b1f17b1804b1-48fe66204e8mr41076455e9.31.1778838471669;
        Fri, 15 May 2026 02:47:51 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5cab882sm54024555e9.13.2026.05.15.02.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:47:51 -0700 (PDT)
Date: Fri, 15 May 2026 10:47:49 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Pavel Machek <pavel@nabladev.com>
Cc: Claudiu Beznea <claudiu.beznea@kernel.org>,
 yoshihiro.shimoda.uh@renesas.com, vkoul@kernel.org,
 neil.armstrong@linaro.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-renesas-soc@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org, Nobuhiro
 Iwamatsu <iwamatsu@nigauri.org>
Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: Avoid long delay in
 atomic context
Message-ID: <20260515104749.24135f22@pumpkin>
In-Reply-To: <agY8NAyCcHkhBvBv@duo.ucw.cz>
References: <20260514111300.2152386-1-claudiu.beznea@kernel.org>
	<agY8NAyCcHkhBvBv@duo.ucw.cz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: BFB6954D226
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32670-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,renesas.com,linaro.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org,lists.infradead.org,nigauri.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Thu, 14 May 2026 23:18:44 +0200
Pavel Machek <pavel@nabladev.com> wrote:

> Hi!
> 
> > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > 
> > The OTG PHY initialization sequence needs to wait for 20 ms at a specific
> > step, as described in commit 72c0339c115b ("phy: renesas:
> > rcar-gen3-usb2: follow the hardware manual procedure").
> > 
> > Commit 55a387ebb921 ("phy: renesas: rcar-gen3-usb2: Lock around hardware
> > registers and driver data") tried to address various problems in the
> > rcar-gen3-usb2 driver and converted the mutex protecting HW register
> > accesses to a spin lock, leaving, however, a long delay in the critical
> > section protected by the spin lock. This may become a problem,
> > especially on RT kernels.
> > 
> > To address this, release the spin lock before sleeping for 20 ms as
> > required by the HW manual and reacquire it afterwards. To avoid other
> > threads entering the critical section and configuring the HW while the
> > software is waiting for the OTG initialization to complete, introduce the
> > otg_initializing variable alongside the otg_init_done completion. Any
> > other thread trying to configure the HW while the OTG PHY initialization
> > is in progress waits for the completion instead of immediately returning
> > errors to PHY users. The IRQs were also disabled while waiting for the OTG
> > PHY initialization to complete, as the interrupt handler may also apply HW
> > settings.  
> 
> Just... there has to be a better way.
> 
> > +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > +static int rcar_gen3_phy_wait_otg_init(struct rcar_gen3_chan *channel,
> > +				       unsigned long *flags)
> > +{
> > +	unsigned long timeout = msecs_to_jiffies(25);
> > +	unsigned long ret = 1;
> > +
> > +	lockdep_assert_held(&channel->lock);
> > +
> > +	/*
> > +	 * The OTG can be initialized only once and needs to release the lock
> > +	 * and wait for 20 ms due to hardware constraints. Wait for the OTG PHY
> > +	 * initialization to complete if another PHY executes configuration
> > +	 * code while the OTG PHY is waiting. This avoids returning failures to
> > +	 * PHY users.
> > +	 */
> > +	if (READ_ONCE(channel->otg_initializing)) {
> > +		spin_unlock_irqrestore(&channel->lock, *flags);  
> 
> This is not nice, passing flags between functions like this is a red flag.

It would be better to just inline the code.
And I'd guess you need to redo the initial tests after re-acquiring the lock?
Or even need to do a state change/reference count before releasing the
lock to stop other threads 'doing anything nasty'.

-- David

> 
> You are only accessing otg_initializing under the spinlock. That means
> that READ_ONCE is reduntant.
> 
> But AFAICT spinlock is only held over this function to protect
> channel->otg_initializing access. I suspect correct answer here is
> getting rid of spinlock over this function, and using
> test_bit(BIT_INITIALIZING, ...) or something similar.
> 
> Best regards,
> 								Pavel
> 


