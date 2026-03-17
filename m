Return-Path: <linux-renesas-soc+bounces-29627-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKAVO6d/uWmxHAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29627-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 17:21:59 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEDB2ADDB6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 17:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45CC530F4EED
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 16:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E4D20DD52;
	Tue, 17 Mar 2026 16:15:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C94E3B28D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 16:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773764130; cv=none; b=G6vBbfpGls9zrDNRUrxS8f84vC+Lfrnoyh6CQAce1YYMWxbl7olHkr9u1BD11gUT7OMkUtXGMGDoHMIX0cF4cbhwvgxqOZarr70IETgZEccPRU+f1xydypBbiAuwaB9qZonNmBUoLYnSIDJr7JxuAkQvzMNtRdwZ94vZGD8qO90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773764130; c=relaxed/simple;
	bh=JpuNcXAUnz9p4OJygOPh4/7FUlRl3uj4sIh8x/TCmn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BI6GDo1+8r5EYOQoSV+aZPkz2Z0bC5hlgLhTv1wV02+qQ4rjtx3fI6cCiW3GE5eVnW3G2VE7P64ZLGvaAbnhoODOYbtxGKCjKMuSqzOa//9eAq6w9z+XVPMyQnYtDT+ElQ1iKEjCJVJc+pnBqCmMj2S/ZjeIBKJnOUy7kycDpms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56b8804f37cso906972e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 09:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773764128; x=1774368928;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dICWkMmyuTmNF364Pzh8uUC2Sv1l+UoGtlNAuC5g+WY=;
        b=GNsR7qfkNbxG8zt5kVXTTOXMto9w32aDs/9et9T1aJzeySti/7E6nIyLkYgO878P+T
         NVQrbW7nPSUBx+7vdiRjo0EAW8+H5JBnMSKRQwrsqIEJdq+iNH1cXZVz/TDgf4sV3aM4
         vwO5KR/2siQG/5J9qmn+sTDiVui1TB/VL/ws9F//gPN6DNOHq4HVmst+Zmz4GM21YzsL
         BgFRLtUhAPJn3kOQItRFuB5wqbxGErqu5RvdYcL04ue42YRhh1VS9W3m+P+VbdWUkQAW
         ctyPwf77fgfupxDr35cYShTWysoQ83O+AaftEzdqCfA3gPvFv3Oo9hVoGoV8H99QC7fc
         aZqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL8XPG5debs5BSHg+0KJBknVf7i51mqr77iRFK21jA2zG9DDrfglrR6p4RZGGRgHXHB1GRv/aKxNJzka/NDOAwNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1zoAcuweW5L7n5LqwhpWwkTgc2dZG3lVnSAqMxR6W44JbigWH
	2FtIJFWqC5XXfUheNcu5A4wVhPmFhygh9nha6tRuGnqOWbhrxEYtFFhckhBjtenLOYo=
X-Gm-Gg: ATEYQzzb5Dt48djcXmDsQfNwjLjlc4YkLMlRlL7NMdXpzGktwZq5Ai2ss6rlrU2MkRx
	4tNYeLONRPMuLMqtlZ02DfL3JJxuNW6/iqEEzgNjOQBdmIJiKSNeinpawGNc+kYWfhC20YxDnYk
	LDnLFmwLl3l8oqLR8oKcu/P+HJclSplabJFrDzk+tN9dbOdtqkrEgYKjOORSEnZGhr2esBSD2Pd
	6h5lbi+JN9Z/zNeVCouJbiPoWk30Co8aWgm0k1Bvcxp0zm8b6OnYyJ/dN01xUExwu1ctG6orI3h
	SKnBRRINl24RXn4rXSfHzPAXa1xkItn5XAur9/SqwCjBeFO654jAiR6sEuKozES8OI1R20oklCn
	XaSXWAmz+6WWzqfM3MXl+GafE6n9cwU1LJy8aMNC57pxQ6IHr5WG9t1ACskXBaOfP1+Ry94YX1K
	LvGA2k0czG6oYx4D3Z6Lotnkjee77iKdwFnMkwea7u3ZGc4fK3mgXT/LDvsrl8
X-Received: by 2002:a05:6122:d08:b0:56b:8e1c:582d with SMTP id 71dfb90a1353d-56ba717f6b1mr163141e0c.14.1773764128222;
        Tue, 17 Mar 2026 09:15:28 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ba6fed64csm116952e0c.9.2026.03.17.09.15.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 09:15:27 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-950de852f31so620642241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 09:15:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX3hJP48GslIlmGp4iAnAp0qtFmrfMri/7eQN3idBvAdoVWru6bHtGNQxPf+U2kVbnC5HD9an+eyQjNrHFChbJGjA==@vger.kernel.org
X-Received: by 2002:a05:6102:358d:b0:5ff:2426:94ed with SMTP id
 ada2fe7eead31-6027d3bc90bmr139185137.28.1773764126619; Tue, 17 Mar 2026
 09:15:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317-rswitch_add_vlans-v1-0-3a57bfa0f2d1@renesas.com> <20260317-rswitch_add_vlans-v1-6-3a57bfa0f2d1@renesas.com>
In-Reply-To: <20260317-rswitch_add_vlans-v1-6-3a57bfa0f2d1@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Mar 2026 17:15:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXKthoDYtNKimB6S8m+ukWQVMEOuLbZFkWrwqre4c1V5A@mail.gmail.com>
X-Gm-Features: AaiRm537AkTROl3nLdQemkDiRiXSF3TuQr0OjAH_I1sZc0Qa1zvlHweun1p94TQ
Message-ID: <CAMuHMdXKthoDYtNKimB6S8m+ukWQVMEOuLbZFkWrwqre4c1V5A@mail.gmail.com>
Subject: Re: [PATCH net-next 06/13] net: renesas: rswitch: add forwarding
 rules for gwca
To: Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-29627-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.898];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,renesas.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5CEDB2ADDB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michael,

On Tue, 17 Mar 2026 at 10:45, Michael Dege <michael.dege@renesas.com> wrote:
> Add rules to forward packets from the Ethernet ports to the CPU port (GWCA)
> using L2 forwarding instead of port forwarding.
>
> Signed-off-by: Michael Dege <michael.dege@renesas.com>

Thanks for your patch!

> --- a/drivers/net/ethernet/renesas/rswitch_l2.c
> +++ b/drivers/net/ethernet/renesas/rswitch_l2.c
> @@ -93,10 +93,36 @@ static void rswitch_update_l2_hw_forwarding(struct rswitch_private *priv)
>         }
>  }
>
> +static void rswitch_update_l2_hw_forwarding_gwca(struct rswitch_private *priv)
> +{
> +       struct rswitch_device *rdev;
> +
> +       if (priv->offload_brdev) {
> +               rswitch_modify(priv->addr, FWPC0(AGENT_INDEX_GWCA),
> +                              0, FWPC0_MACSSA | FWPC0_MACDSA | FWPC0_MACRUDA);
> +
> +               rswitch_for_all_ports(priv, rdev) {
> +                       rswitch_modify(priv->addr, FWPC2(rdev->etha->index),
> +                                      FIELD_PREP(FWPC2_LTWFW, BIT(AGENT_INDEX_GWCA)),
> +                                      0);
> +               }
> +       } else {
> +               rswitch_modify(priv->addr, FWPC0(AGENT_INDEX_GWCA),
> +                              FWPC0_MACSSA | FWPC0_MACDSA | FWPC0_MACRUDA,
> +                              0);
> +               rswitch_for_all_ports(priv, rdev) {
> +                       rswitch_modify(priv->addr, FWPC2(rdev->etha->index),
> +                                      0,
> +                                      FIELD_PREP(FWPC2_LTWFW, BIT(AGENT_INDEX_GWCA)));
> +               }
> +       }
> +}

This looks a bit hard to read: are the bitfield values in the two
branches the same or not?

I came up with the following, which avoids duplication of the field values,
and of the control logic, but I am still not 100% happy with it:

    u32 fwpc0_clr, fwpc0_set, fwpc2_clr, fwpc2_set;

    fwpc0_clr = fwpc0_set = FWPC0_MACSSA | FWPC0_MACDSA | FWPC0_MACRUDA;
    fwpc2_clr = fwpc2_set = FIELD_PREP(FWPC2_LTWFW, BIT(AGENT_INDEX_GWCA);
    if (priv->offload_brdev) {
            fwpc0_clr = fwpc2_set = 0;
    } else {
            fwpc0_set = fwpc2_clr = 0;
    }

    rswitch_modify(priv->addr, FWPC0(AGENT_INDEX_GWCA), fwpc0_clr, fwpc0_set);

    rswitch_for_all_ports(priv, rdev) {
            rswitch_modify(priv->addr, FWPC2(rdev->etha->index), fwpc2_clr,
                           fwpc2_set);
    }

Can this be improved?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

