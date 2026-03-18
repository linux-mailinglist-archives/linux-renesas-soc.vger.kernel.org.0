Return-Path: <linux-renesas-soc+bounces-29757-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +C0UB4iFumnrXQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29757-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 11:59:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB642BA58D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 11:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48CF1310FC2E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 10:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FEFD3A453E;
	Wed, 18 Mar 2026 10:54:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B833A452D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 10:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773831280; cv=none; b=gPK9mfVEcFAna0BiGw+JQXsZlcXn3eA1hBSyGlZo8GTqa3J4EYCWLtVI6o0XMzkgv8gNVu5CMTnq77XEmS7PzkL8vplNEP6Jbip7B5HZPnDIfJNJePEz1F4o3tqwYTNJ9kyT/j05ewS7Rav7cmL481lumvfX/GoHvr1+UDv6Bl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773831280; c=relaxed/simple;
	bh=F801OhlCfKFa4xSQ3yL2bq2kDykIuH1lew57+kHCFq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LtI7Z1qJDfXvc0OwgLwa/Vk4/gFSxFvkX7Tpr9ettjD1pdi82R8Ex7Km6l6G4ecNZ3T1u/wyfT/GAzQLwdTnxhy89adhLphA/0D51LVKsyRzgJA5+wpswU405fH0CZfsdkI9t8VlJiRkfGr9Opp+i+BUGt1ajL7kiXYK9390igc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-94dcf70af41so1537138241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 03:54:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773831277; x=1774436077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jivaoZ9yjO8A/07kCRdM84g2a/Kld4eTNJjto56HLI=;
        b=Tpt1M7SCiHJZKIGdSsl/UQaO1Fqeg6CD8Vi1qLMLXLbKoVkm6tLFDsHzHpMQ9PYzAl
         O0KEtZAzKSqv9RuE1cUtdMT5up3U2osXNJDy4JY/qXC/WfXVTLLemausVXyw/9aLANHN
         Jrsj/g9tJEoKEfiyOte99Y+x4/H60a+/VinrjcPzh4n8EXpZT5gqNkaeyrP3/lTK3xPC
         ReEeWE36inknTqKxTAad6fBK9Gy3NxsB/mHM7Yfv0mGx2fHRLGb/ycBmjdqsvADETdXl
         SgTUx6E3XDSpL3akvHn4+zH0eQjWNBxHt2qtAcheZJtfcaxCtKKXm4jngqlwh+gU54Qx
         e72w==
X-Forwarded-Encrypted: i=1; AJvYcCUCjRJj26IHoz+NGARbyRgtdY2XMMDY8mWB4XZ+t06A9SeRp8hmdxoJqH9TGerMQS0Q7GZzRmGfziqcsZc52AES9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4tfKQW9tTBpRNGc9Hk5ITloy9Ddh2bKXPt/J2s1vVd/Tq4ql2
	E8IcTF80WgjTwdJPr/2vJXKYjWOa9XiaEsfVniRp8/Y4hcKW2hhTaM+Va4pbUGkp7Pk=
X-Gm-Gg: ATEYQzwy7hxe/DbKvbRhbd0Rz4ewN1SYt3EijfN6A+k+P7IE6WjsRAM0/hTX/00mJi0
	t+XzP6IkvbFnjY7Y6PmINr2xtN/HJPwwnp3VGpCkppuK7LmTbGEMimMDUecA9pFXzGRq+TL8HwR
	xh1raWW6pAhm9wNh69D5tL2LcV2GmXYZjixk7WWVmYzcJ9J0OsQ7Zas4ySWqrlsSiEGqUKntsEi
	bsow5PMB8agPzAqNv8+wKTSCToKbvrMWanf5z3x6tYT3oCDFjp23fBZgLtq5JCYNLVDJ9skoGKv
	uMdfofXP35TPKpYf/rorfkNSUObxX1ccyv2ihtTluyYyHsIJAkIuWpZy34u7s59nENkWxPVdwNA
	rTHkEJX+s6QPSFCGhkje8HZtLLGekM1NTWL3QoMHj3OBhweZvXjDc1d42HJlhUoykI6Q1G9vctG
	dInQnM0lRDt/xcea9rjVzOdZYsLHa5VpwKDeQfWMVAGiYmGvKGpsZLQnDNW+Hw
X-Received: by 2002:a05:6102:4193:b0:5f8:e3a9:4135 with SMTP id ada2fe7eead31-6027d111d1amr1322512137.11.1773831276945;
        Wed, 18 Mar 2026 03:54:36 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6027eb6536asm1154651137.2.2026.03.18.03.54.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 03:54:36 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5ff05af29b4so2011058137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 03:54:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVY8Mpmgmpt403D3JSifLiiZ/xi0VlGXnP0KI1cwmalgK/9MrjkZifsWK5C+Oe3qUyr6HxGnXKz+CrJZinUO5YZ2A==@vger.kernel.org
X-Received: by 2002:a05:6102:5108:b0:5ef:2457:8015 with SMTP id
 ada2fe7eead31-6027d3af482mr1147178137.29.1773831276348; Wed, 18 Mar 2026
 03:54:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306134228.871815-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260306134228.871815-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 11:54:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW1O=UMekx1YUmYYOJRSKG2cRV2fNCOH9dMeLh3Yvihrw@mail.gmail.com>
X-Gm-Features: AaiRm51auCuQxyhAsZpw3R8iZHeQa0kBUg1xHFQIVFYYS6l77UrkiPZpeaoq3ro
Message-ID: <CAMuHMdW1O=UMekx1YUmYYOJRSKG2cRV2fNCOH9dMeLh3Yvihrw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add critical resets support to RZ/G2L SoC family
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29757-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.951];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6EB642BA58D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Fri, 6 Mar 2026 at 14:42, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Some reset lines must remain deasserted at all times after boot, as
> asserting them would disable critical system functionality with no
> owning driver to restore them. This mirrors the existing crit_mod_clks
> mechanism which protects critical module clocks from being disabled.
>
> On RZ/G2L family SoCs, DMA reset to be deasseted for routing some
> peripheral interrupts to CPU.
>
> After a suspend/resume cycle, critical module clocks may be left
> disabled as the hardware state is not automatically restored. Unlike
> regular clocks which are re-enabled by their respective drivers, critical
> clocks (CLK_IS_CRITICAL) have no owning driver to restore them, so the
> CPG driver must take responsibility for re-enabling them on resume.
>
> Biju Das (3):
>   clk: renesas: rzg2l-cpg: Add support for critical resets
>   clk: renesas: r9a07g04{3,4}/r9a08g045-cpg: Add critical reset entries
>   clk: renesas: rzg2l-cpg: Re-enable critical module clocks during
>     resume

I assume this series supersedes "[PATCH] clk: renesas: rzg2l: Drop DMA
driver dependency for system boot"[1]?

[1] https://lore.kernel.org/20260130143456.256813-1-biju.das.jz@bp.renesas.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

