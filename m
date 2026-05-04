Return-Path: <linux-renesas-soc+bounces-31939-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yN+QOjeH+GkZwQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31939-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 13:47:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3264BC986
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 13:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CF193003636
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 11:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56563A8FF6;
	Mon,  4 May 2026 11:45:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F02637DEB3
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 May 2026 11:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777895111; cv=none; b=eiFnDOWpVGXF9GH0XXN66KoI4H0RpWMzyTp0ALzCWXyXZCbYx8ubrcPGE8QyXhc7a2qr6MT5WwWoGTWuy+t5Qkj9+/JS0ZuNvKRVGtN4lyq4KYSA1qUnNjsIVYFar8GU6LSg8RwG93vee/y4ephPAXHnmXaPA7Zt4lVmig57Zk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777895111; c=relaxed/simple;
	bh=gkvgg6JEGcXT+1T5vdHTl3rgGZ7Mb+fk1m1Ka1m3dI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P4wVD/+nuW9KnwEMeHqkc4qxunbHVzVNLcCJjVAwLYrnycdi4B7XLmAOYlr37g0cyFhJDZ1n1jZjpb6J6HHSJd7xeXfWrvUYNF5mUJuMYIa22VqtHD5IYcW6YTR6yYjOoSu64wSE+vuagpeBfjVD7R8aefxwv+Xry93Ay5sdOK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5752b279662so215888e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 04:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777895109; x=1778499909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HG/BR7xGQ0GXfmqp04teJGIjPf2aTf3X9EhkDQ2kDok=;
        b=UhAL128OUlviGq+53LuMYC2CQsyVaKhHDg9Bc+8YLO74ExOioNFagI670XxFJI/SHY
         XVmB9+aq8A85IsGmuM297G1HblwdamMV+7USBzELWm3kjBB1OmYafHlDKJBheGWQr7za
         gjAgRxoM+oTeGA1JiOKAdFo4RHrv/OvywfNUCQPUPlr1nnE1AZFQJ9Gd9g07f6qRisFC
         eFJThzTw1bC9XNFO9KBj61F22rHZdg5U7IHxbrZfeyz2yb1upOX8ESuyHnBuhFKqjNn/
         yWNjCXyoZfJADod4L6N66Ehltqp9cssX0o/P/ndfANEh2EXT0FBFAvog/pHeVc0BjDg1
         vP8A==
X-Forwarded-Encrypted: i=1; AFNElJ8L8MWYmORCU6e/41/piiV76/+mrqgyZ+ESDEq92wVKWTyuBn/HxqkC+irlJ9mbq9oFD4uNedQe9oVmXiEQdVBMJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YynUlLVmR4cprjs3yKBN1s/nqmrE0f74XVjOmcSqKUZHFzee9oZ
	/Tx7GBIdppdTZICQg0PguyBfJtmviQ841HF6d3ZyOFFEM9fswJ9vSKQnL/JIA59s
X-Gm-Gg: AeBDieu9rUpH+NN3OhK8d04I7VUVT99tp25ViHKju1E68K+l2ntuiv83efmgMSpRi1O
	AD+yLQq2WXBjqjhdnJTPTw54d/kcTLcVqruRCbIOWl6aiO2MoMKAHxAd7oLRwNsVwL0A548gpNK
	9Wv92b/gXP4tKP/SoxFfBjKt508JFACU07WGWipisEDKfwyI99gCBW4xyhI/tTYxO3zePO9pGbp
	bQms21cy5iR9f3CbhKGfiDNpY5uosdgGk8oa7HpQQjyFgKShveMD2S3LqP8y7eOVYN6vW0ghrsq
	7OyWtd27BmdELR3wJY4u+5k3Meg3/sHebSrFGZVhTGgeFaYYuwLXIKOwu+tfdyZbzxyWUDfYop8
	j4JQc1+R5/raYDhemkx1Ie3t1Rg/gHoXM5l4HTAt5Fbr5FkeE0oSZFrooiXa4nu+n/fhqSNiPmw
	owEQMlV3Ge6or0OUohCR+PqWpF2bL3ZP6J1ZGzUyMAr1YJC7sewp2WCYSFI4PTQVcblKK6a8hog
	YgJd9IM1AEYbA==
X-Received: by 2002:a05:6122:8290:b0:570:f670:587d with SMTP id 71dfb90a1353d-5750ca2122fmr3341927e0c.12.1777895109028;
        Mon, 04 May 2026 04:45:09 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-574a6ef4012sm6062561e0c.18.2026.05.04.04.45.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 04:45:08 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-57513733658so331743e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 04:45:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+pygFRkXphky8XSIZZ4oMg6x/IOJpoOGyXBreWCTQdjmvQR97aEolVKXFZdKG+Qy/0ohZVKNAKM8DseriAwo5uPg==@vger.kernel.org
X-Received: by 2002:a05:6122:80d4:b0:575:24b5:88e7 with SMTP id
 71dfb90a1353d-57524b59d5emr885661e0c.11.1777895108303; Mon, 04 May 2026
 04:45:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427194741.161533-1-ovidiu.panait.rb@renesas.com>
 <afd-gj-F3OYDfCwJ@vaman> <OSOP301MB19766FF764E6626FF1CD6771D3312@OSOP301MB1976.JPNP301.PROD.OUTLOOK.COM>
In-Reply-To: <OSOP301MB19766FF764E6626FF1CD6771D3312@OSOP301MB1976.JPNP301.PROD.OUTLOOK.COM>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 May 2026 13:44:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWT+hv37gxi-5fbLVc16Fk4SKsXuBis5Fg6_zm7TS6hkQ@mail.gmail.com>
X-Gm-Features: AVHnY4Kj8qbZMTdvG7wtnzKp_ceFYbhvcCDqsIIsLiM97LFAw87IuzHnlnXpOnk
Message-ID: <CAMuHMdWT+hv37gxi-5fbLVc16Fk4SKsXuBis5Fg6_zm7TS6hkQ@mail.gmail.com>
Subject: Re: [PATCH] phy: renesas: phy-rzg3e-usb3: Fix runtime PM underflow
 during suspend
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 4A3264BC986
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31939-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email,sashiko.dev:url]

Hi Ovidiu,

On Mon, 4 May 2026 at 13:11, Ovidiu Panait <ovidiu.panait.rb@renesas.com> wrote:
> > On 27-04-26, 19:47, Ovidiu Panait wrote:
> > > On the Renesas RZ/V2H platform, if the xhcd driver is unbound and the
> > > system is suspended afterwards, a PM underflow error will occur:
> > >
> > >  # echo 15850000.usb > /sys/bus/platform/drivers/xhci-renesas-hcd/unbind
> > >  # systemctl suspend
> > >  15870000.usb-phy: PM: dpm_run_callback(): genpd_resume_noirq returns -
> > 13
> > >  15870000.usb-phy: PM: failed to resume noirq: error -13
> > >  15870000.usb-phy: Runtime PM usage count underflow!
> > >
> > > Since the PHY framework is managing the runtime PM of the PHY via
> > > phy_power_on()/phy_power_off(), there is no need for the PHY driver to
> > > manipulate the runtime PM state during suspend.
> > >
> > > To fix this, remove the runtime PM calls from the suspend/resume paths
> > > and add a get/put pair inside rzg3e_phy_usb3_init_helper() to make sure
> > > the clock is enabled during init, even when there is no consumer for
> > > the PHY.
> >
> > > Also, change the suspend ops from NOIRQ_SYSTEM_SLEEP_PM_OPS to
> > > SYSTEM_SLEEP_PM_OPS because runtime PM is disabled during the noirq
> > phase
> > > and pm_runtime_resume_and_get() would not actually enable the device
> > clock.
> >
> > > Fixes: ee5f1a3f90a4 ("phy: renesas: Add Renesas RZ/G3E USB3.0 PHY
> > driver")
> > > Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

> > > index 6b3453ea0004..055775e1a0f7 100644
> > > --- a/drivers/phy/renesas/phy-rzg3e-usb3.c
> > > +++ b/drivers/phy/renesas/phy-rzg3e-usb3.c

> > > @@ -215,27 +226,21 @@ static int rzg3e_phy_usb3_resume(struct device
> > *dev)
> > >     if (ret)
> > >             return ret;
> > >
> > > -   ret = pm_runtime_resume_and_get(dev);
> > > +   ret = rzg3e_phy_usb3_init_helper(r);
> > >     if (ret)
> > >             goto reset_assert;
> > >
> > > -   ret = rzg3e_phy_usb3_init_helper(r->base);
> > > -   if (ret)
> > > -           goto pm_put;
> > > -
> > >     r->skip_reinit = true;
> >
> > https://sashiko.dev/#/patchset/20260427194741.161533-1-
> > ovidiu.panait.rb%40renesas.com
> >
>
> I think this is not applicable for our platforms, as the power domain only
> gates the clock during runtime suspend, so the register state is not lost
> across runtime suspend/resume.
>
> The power domain (drivers/clk/renesas/rzv2h-cpg.c) is marked as
> GENPD_FLAG_ALWAYS_ON.

Won't the SoC be powered down during s2ram?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

