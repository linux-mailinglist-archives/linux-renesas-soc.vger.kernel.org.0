Return-Path: <linux-renesas-soc+bounces-32018-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOr2ChSg+WmQ+QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32018-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 09:45:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 981524C82C0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 09:45:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90704303E208
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 07:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0413AC0CB;
	Tue,  5 May 2026 07:43:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E02F3DD51F
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 07:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777967038; cv=none; b=ioWKwEjFTR3+StkCcBLwlAjBlyA6rHrFuLJ6Kfikg5n3/3Ee44/SjuFtKCVkjhvyHvvRHEGHKfbrG2g++assMXyLS/zhmPDLhg20P8nK5uEp/GjcLQsi5HNFT9igiDEZNEpaTZ5yAAAOwWsi+HJwp/tZ5KsHhn42gU1zBrV9cYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777967038; c=relaxed/simple;
	bh=Q3aLbLV9y/ki6JG9scyklXU4QHub6I9VOt7nf73uR2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=INXg74ISWD7TbZCcFXwa0nhs+0wMDa+kEEWWNAy1YczSwMdg9BKZ7Tl9MAbk0P8PSXBRA+4PZQuxIbnCPwZkPLAoUzb3IM1Orfmxy1L0KG5f9TEAOFIhgjf5ojZSoeh6ggcbf3MWGGpNqYKdi5gmq7A77mf1fo3cRAIxAo07pnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56f6afbd205so2526912e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 00:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777967036; x=1778571836;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VoHams0THP6xHqBQZRrSzuHD9mE8YcqxXe3rwyOjojQ=;
        b=QEPgVdmkebDTlN1KZe5mKGWo9PCaolUsqrwx8+xKQu4DXRrWvMqJrhdnDdaVUchnqO
         c9+wG7ro5F5lsC1nDw7OYrWkNkBr8PSGHJUzHvVRxqO6r7VsPX8wmYLC6pF/Hv2fvmLT
         nOE6IqNctE4Iavq8FuvgSwLCW7SOmgPHeuIH1Q1ydkhyCwZM3OQZTllEZ7SzXJXavzH8
         SFu0oy56FICr5YxE9VegH/JemgmkgZD0DuAgP0EAyygaFQgwfS9oXfo0mHs2hn5uLnzJ
         RracUJYFGDrro0XDAB1mSaOW0e5d0DTUjgLttSoKcTMqX3re63kw/6mx/RfHsq1MMHbc
         /B5w==
X-Forwarded-Encrypted: i=1; AFNElJ9Fw5XXVP9tjC8Aj274wfRidB0ACnq6Wt/T4otZnrhqKXAHtk6DBRuj5yEa8F/97ZikuecOtGjBmV4NDuW7KIt9kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPi1ORBXS8ywKrdS38m2cMfJI62t64tbvyTRhJ+bW1X/tnB3j5
	KX0YejxrH8k2W3uvo+wTuPLlSEWwpNKcih04CqFS7qYEj85aRwr8m2IB8RXtyXWx
X-Gm-Gg: AeBDieuvV86m+gaoVKEThbAF/JAiU2fDjpZZMa1zuxZ1p9upJf0O+1OpRwmR3ccp7wB
	/V91Vq4unxG0hOlbmdqKzo3jRjoGTX4NMvcy+uBv5Wz10YS8fePUcMpDestRNF8I5wCFDskKYXE
	9Ap8zyMEgROEe2avs8Bu28cdKdjSOOUH4TMycoKUy3cs7J9eG6GDwkgB9JOaogQneFxVNTF/IpM
	uLuwY7Xwnn4LoXlTJqUeyDDHtLt5b9yNILHmD3Hj8D4wUmbWqL6TXMRtPpemwGkNHITPHNkfzeY
	RLdtEt8L2JS6JYNeaXTxNVF/aaDpfVBTgjwNZ64XhbwhdT7LbtMJlBmQk/PsEN8eYDgUm232cBS
	G4oZhfSNUtZervXoCrgpnX13g7f73w1PBaUjxdnEpoWG8nKXpob3nP6k7QXJcHaOMiCsJYfiJVq
	pJA/+0lHJ+GdNhX/TUC9ZlWrx8fsSpfX93zCboVg99ep9ut/ggvCyrEbI08EnGyuo5jV5OQeIXQ
	ZyIvcKnU8e5GA==
X-Received: by 2002:a05:6122:6587:b0:56f:a0c1:2517 with SMTP id 71dfb90a1353d-5754470af00mr1102206e0c.8.1777967036437;
        Tue, 05 May 2026 00:43:56 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5749f85940asm7636802e0c.7.2026.05.05.00.43.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 00:43:55 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-575212eb419so1436527e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 00:43:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/lCk9q2uqM74YsDMbnO1qQYOE7yF3M9c6gdmGYKPBLNdvq9Y+TLuouC+6fLhVVFnlm5KCX+g//o4+lLTpMhQVDrg==@vger.kernel.org
X-Received: by 2002:a05:6122:8106:b0:56f:b831:909c with SMTP id
 71dfb90a1353d-57544474e1emr1023308e0c.1.1777967035606; Tue, 05 May 2026
 00:43:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504200356.3529873-1-shitalkumar.gandhi@cambiumnetworks.com>
In-Reply-To: <20260504200356.3529873-1-shitalkumar.gandhi@cambiumnetworks.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 May 2026 09:43:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVzkRqdRBr1z9Gi2MXUZZBpVnVSkG0Jh6uG+VCdKbN=ZA@mail.gmail.com>
X-Gm-Features: AVHnY4JoVV9GX0gOfo6gHy4jhoN4HUM1LvIjejFvK9-P6xXjmnQOxuy5FcVEKn0
Message-ID: <CAMuHMdVzkRqdRBr1z9Gi2MXUZZBpVnVSkG0Jh6uG+VCdKbN=ZA@mail.gmail.com>
Subject: Re: [PATCH net] net: rtsn: fix mdio_node leak in rtsn_mdio_alloc()
To: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 981524C82C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32018-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.989];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cambiumnetworks.com:email,linux-m68k.org:email,glider.be:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]

Hi Shitalkumar,

On Mon, 4 May 2026 at 22:05, Shitalkumar Gandhi
<shital.gandhi45@gmail.com> wrote:
> of_get_child_by_name() takes a reference. The rtsn_reset() and
> rtsn_change_mode() failure paths jump to out_free_bus and leak
> mdio_node.
>
> Add out_put_node to drop it before falling through.
>
> Fixes: b0d3969d2b4d ("net: ethernet: rtsn: Add support for Renesas Ethernet-TSN")
> Signed-off-by: Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>

Thanks for your patch!

> --- a/drivers/net/ethernet/renesas/rtsn.c
> +++ b/drivers/net/ethernet/renesas/rtsn.c
> @@ -797,11 +797,11 @@ static int rtsn_mdio_alloc(struct rtsn_private *priv)
>         /* Enter config mode before registering the MDIO bus */
>         ret = rtsn_reset(priv);
>         if (ret)
> -               goto out_free_bus;
> +               goto out_put_node;
>
>         ret = rtsn_change_mode(priv, OCR_OPC_CONFIG);
>         if (ret)
> -               goto out_free_bus;
> +               goto out_put_node;
>
>         rtsn_modify(priv, MPIC, MPIC_PSMCS_MASK | MPIC_PSMHT_MASK,
>                     MPIC_PSMCS_DEFAULT | MPIC_PSMHT_DEFAULT);
> @@ -823,7 +823,8 @@ static int rtsn_mdio_alloc(struct rtsn_private *priv)
>         priv->mii = mii;
>
>         return 0;
> -

Please keep this blank line, as it serves as a clear separation between
success and failure paths.

> +out_put_node:
> +       of_node_put(mdio_node);
>  out_free_bus:
>         mdiobus_free(mii);
>         return ret;

For the logical change:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

