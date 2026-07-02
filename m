Return-Path: <linux-renesas-soc+bounces-34660-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lxozLV9iRmqGSQsAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34660-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 15:06:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DDF6F8215
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 15:06:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Ewxxzm3k;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34660-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34660-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6CFCD300AC89
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2026 13:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB8848C411;
	Thu,  2 Jul 2026 13:05:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D571A492185
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Jul 2026 13:05:21 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782997523; cv=pass; b=Zj/V9gXlTv+d2VKYBEop9lF2O/GbiPeE7w7K0fRzoJPtkT4se/OgOJX1XTDpc5j48nkP5VFK7VDAL95fh34eTMM6ojRqd+4zYv4oUkoqxlqrWfyywizForaYHABrsAOQCcbU8I8vPOrvroFICsXjhsvmh/rkPfHja8RQ4hSs5fs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782997523; c=relaxed/simple;
	bh=5pyf3CDAjQAQNG7cl8o/3faXBoSByxqpOeTmnktr1ZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=De+nCM7TMEnaMLkCqNviXP6FIx+eyBYxgXiggdBLQWTjrKXnZwqNq65NG+fR7pK2N4MOYiho9SzzcKJSXs5XBls0ENibECJfC+KQHYjSKMhjggGV8n+YVIICbW0EfJnGWD3wkr/W3Je8xZHa8HQhlXQ1jX/t9JbHqEWw0ECnvP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ewxxzm3k; arc=pass smtp.client-ip=209.85.221.51
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4629051c9d1so1181066f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Jul 2026 06:05:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782997520; cv=none;
        d=google.com; s=arc-20260327;
        b=P4IJd2+NAqiLnN3wMM3gUt7nGVF3IT+wcKCB0zSNvU7rgovG4ckSmyT3Hqoi3A1B8h
         BjL2NR0XXcti+PQyKCYcZUhHwZSrCrxwvIk8vDWEwqVlVELPiX5YJQUkrx7yEm46jms3
         eYqVrlJNiFDnqaOrQnLzqM0ezuJ/4Y5/ZNODo804iDo4Q5M/s2RADzzgrH5qYu4/bpjN
         QAOWNpskQ9/2kIVljofpOEr1CYkpz5FjgHWkSYOGOPYVPE72GuDbAvg5hx3uER/LhU1t
         RhyLaYLk89GMeCHzFBYXOFmuIPEbN5xDb9+HeDlMsZoPrxkRdPkUY2KEz46NcmKTnmPZ
         oRJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uL99PvBKlKoYRi5dLWiDvrrzNBLVjJWycSXQYHd0R3Y=;
        fh=7cQv1nRjYNdh9b+eiWTJJa2Ozq0LJWw6OAU3pnGVmKY=;
        b=UTLtE9uLTWLMNhag+f9FBIoIVtgsRAtm8VH0uzDC87A/G3AvdanfilQ67C1luqtU9p
         EaafU3qXif2pNycCYmGkQJlLR+8Abrw6uUvyIu1olcruHK/4t/GGwkMGsVb+42ZyH38m
         Ulr9eIf+fIClaXAfMRqVRBNpkIlIJMqZO4jhP32d00CHj/VgN1Kv7hSWhwdD50xdSVg/
         GBG3aQgcot+DMVvtdce8FgPn1g3R/WpT9KifUGqWi52/cIkfooue8Q+HwjnyWYjzi/1N
         LB4R2IxTQBN2bwyXqVxSKi+rIvd/Bl/Up55stch4Jyaeu2gvqYefWLOrCk1ijg37bY6p
         Ms4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782997520; x=1783602320; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uL99PvBKlKoYRi5dLWiDvrrzNBLVjJWycSXQYHd0R3Y=;
        b=Ewxxzm3kRzT9TkbjBz2TLhrNVHQfquQrm4/RE816qdkpiXUUM9Wxofta+2ZtgFR0Rb
         4ekDcJ/AmT7CK7/kXjzQ0QBCr1FOGgGcNRia5oojvXh1y+nSCI4DhWWENhoGimvWfdbO
         7s1Bd3vtPEo8DSf4+h/aKeTZ4jAd60BByBi6eo3mFbUlLlCEK9KDb3jSXp+OL1xdIJrw
         WLFESQhC0AV39xH5msSVJ9i7OstDbaCtkRuroAYRvPBph7GhJYtJid9NCiRxuF2crCnA
         98Ydg7prCdCr4b5zKrCLdRgVERf5Vrb16cJ2NZVsI7G/MFNqBLtJ5BXPYir5oYOstPI7
         0j4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782997520; x=1783602320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uL99PvBKlKoYRi5dLWiDvrrzNBLVjJWycSXQYHd0R3Y=;
        b=LvmB9ZWiMixL3oDkdDuBVMGyszaA9kER1v6uBFXsrb59rH1XupGgvKmU/eVjOUJ2hb
         pbuOpLbFgA+euzo31n8CXg4vCKhSmhB5HtZO2bcsQqUH4vcoFkRTpLWy+ZsinNeqPDz1
         9CnKvePSABJa7VULAeJq/kPrVrIJCVkGowz0p/MPUfy831YbL2AvVISmdxxnAx9YpnIj
         ZrXHPn0lWWkFfkLxsiAftHHwUmy5kzqhUMO/TFJUsZYPJMZ+LoDp/IGr2WF3IfDnuaOU
         nPOwj5Hxmk+mQ2dvFus4iov8xDOp6gNM66c9KxGqZHivfwqnFXnOLiF/ITZ2P+wSpfTv
         X7pA==
X-Gm-Message-State: AOJu0YznNJTnUzV5tWZnduODDdDF+PtyNxTKGY7tyDIsuQL3hMY6oRL6
	a3L3ZJC52hTct5WHIPV2JcrcNA59XpQ4wJBL17MZvIfd640T+LihSPDynzjQP80sL4Z38GBJH5W
	5J2VxG0MsmKP45ygtvpS77uuqW0QT7Ek=
X-Gm-Gg: AfdE7cmLkVK7621EyFrmakooXU+18+kVTAIuQgg1znjJQh/0pWOfpSEgEqSFu6rSewp
	KyohuOGYeTZFEmsl9eCa5D7m+Ht7CWDeVkUEB1gmZanb8J8lj2GoR1TukuproUN06KrSbH39CFO
	wUq6pKqyH+L3PX3Gx3fygo1rIrOS55dfyywUC76LEST1xHMNq5wSlDsAKoZ8FSNzbxD62SjXNpb
	CB+uqCOP1N33rI6FjM9Y8DQCb9qHPnY5gf8Gx5EvFPy7gP0JqVUZvT9XG/rvu/bfIWk0xGuCMvl
	qRkg3kj857hdkKOznAvcoY28iE9lPezukDrs3eCCoyzbxwK6/70c6dYJ5w==
X-Received: by 2002:adf:ee52:0:b0:45e:d6b2:e6a5 with SMTP id
 ffacd0b85a97d-477b4fb2bd3mr5775644f8f.34.1782997520019; Thu, 02 Jul 2026
 06:05:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702125855.3157253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260702125855.3157253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 2 Jul 2026 14:04:53 +0100
X-Gm-Features: AVVi8CdQlIn1tOQiizFUwZylI6QZQSaA0raBRxFeQukb0RWfwJShlDIxtbMfm7I
Message-ID: <CA+V-a8tEW7Rk3WmOMEnFNtW=FBwhNqSm7bHEdn70LkM_tqXkJQ@mail.gmail.com>
Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: Ignore missing VBUS regulator
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,linaro.org,glider.be,gmail.com,bp.renesas.com];
	FORGED_RECIPIENTS(0.00)[m:yoshihiro.shimoda.uh@renesas.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:tommaso.merciai.xr@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-34660-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,gmail.com,bp.renesas.com,renesas.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 47DDF6F8215

Hi All,

On Thu, Jul 2, 2026 at 1:59=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Commit b6d7dd157763 ("phy: renesas: rcar-gen3-usb2: Add regulator for
> OTG VBUS control") introduced support for controlling OTG VBUS through
> the regulator framework.
>
> As part of this change, the driver started requesting an exclusive "vbus"
> regulator for OTG-capable PHYs with no_adp_ctrl set. The lookup failure
> was propagated unconditionally, causing probe to fail on platforms where
> no VBUS regulator is described.
>
> On RZ/V2H and RZ/V2N, which do not use a VBUS regulator, this results
> in the following error:
>
>     phy_rcar_gen3_usb2 15800200.usb-phy:
>     dummy supplies not allowed for exclusive requests (id=3Dvbus)
>
> This failure completely prevents the USB 2.0 interface from initializing.
>
> Fix this by allowing the probe to continue if an external VBUS regulator
> is missing. Only propagate the error if the internal vbus-regulator node
> is explicitly present, or if the lookup returns -EPROBE_DEFER. For all
> other missing regulator errors, gracefully assume no external VBUS
> regulator is available and return 0.
>
> Fixes: b6d7dd157763 ("phy: renesas: rcar-gen3-usb2: Add regulator for OTG=
 VBUS control")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
Note, this patch applies on top of patch [0].

[0] https://lore.kernel.org/all/20260616104459.410743-9-biju.das.jz@bp.rene=
sas.com/

Cheers,
Prabhakar

