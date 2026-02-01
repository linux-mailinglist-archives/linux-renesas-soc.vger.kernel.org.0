Return-Path: <linux-renesas-soc+bounces-27753-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJc+Lo+cf2nquQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27753-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 01 Feb 2026 19:33:51 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4070DC6EB4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 01 Feb 2026 19:33:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11F2E300578F
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 Feb 2026 18:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C6F285CA2;
	Sun,  1 Feb 2026 18:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuxseuYf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A147628314B
	for <linux-renesas-soc@vger.kernel.org>; Sun,  1 Feb 2026 18:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769970824; cv=pass; b=g6qSjGMmycSk4/g7V6JdS9yVI1mIDzyTM50nCbmoqDLfeuUwpEvB2UtQ0YQFxWmhih6MOB2J99ZAnvsuVGji7BQwIOgLqgKE8E6uR668gzl3Gg+PEoCPGktOn0POTVY2UDrBXob1+Joo1DAb6iVAEXB/DmMAA3eGMJ1ysZrWxEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769970824; c=relaxed/simple;
	bh=hFea+MpgdlgMUUjAVsq/4Azz3DGpM7IngnTvBlvhvMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CDwKjJLUaXhrC1fPdsNUo6K+j0mOcEae9w6BS93l43fSwbv2vBaPB83pMLLjEbnEnrndjxo63IIv4Xlteyt3iUHtHbIipUD/1Hqx1wnk+pXzaG+bsJHdo6dOd0hEpztfdoBUm4WTrrg84ZnylI1d6NlslmPy1rkPBvaU/TVwYKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KuxseuYf; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4359108fd24so2270676f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 01 Feb 2026 10:33:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769970821; cv=none;
        d=google.com; s=arc-20240605;
        b=dE/6cfr437yusCGAYRacHjKbdhsq4BOBbhAwLjt3esP9bE0iskUBhY3uMC+4O848Y+
         gOtKcZDLHdu0eCqZlZue5V2dOiwqHTZzjiAWEkC37PWvWpSlPGaO1Flg0hjFKlzgIyPE
         UI+PCImjpplV9IsSKrNz5/w3sUdMfR1tTIP8LHAKJZ8W8xJfp4v15/Jx/xcZ3RdKR+oW
         vGceJSWXVpLm5Qiz7bnZzz0xhMOE2VjnRcocEaJmu/FjA/BR+ebLiPIhyGcPXwpWLrRJ
         P7bGOYLObitE35ruFGpHrz7E47pN4tCHaroaRXb+o6tlAaqgD3yDRq+Tu0PCBvY6mJsk
         /KRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ya5yGFEaw5toM9HVuI7d0yc/AabXJ23lQu580Ng5uVA=;
        fh=wTnfPne1MVAhJ7yG9j+h5eSfjOrOxfwhMPyRK0WlT/c=;
        b=Eh1uhUalKbaF8KTKwqahPldy/zn51qQyQjxnonvcI9CKNGerSy2Fvh5o0DlTkP8maP
         2iaXA5jYZV5sg5CkwPvx5Q4Un2uMwL7uncIL8oCdBwfhfIFmbtmxvcPPG7CXVz4PU+/Y
         U6V8Srwai8iq5T+jcKolRjCKEymIiqvYHJjFL3v4it1gDztJ6rF1Fb6GnMklGmDmn4xN
         YSphgjXGhUHmMot9dO/x9DXluaDX/TKPM2HouZLENHrPgWujIzLPQiNkRIcYtbTRZJE5
         Y8IBdZaqA4SHmuCFhCTHQm8TB0bBx5AfOAvuFGv3XjwhkiFV889eyoS3O9jdb1+WdAtx
         1J+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769970821; x=1770575621; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ya5yGFEaw5toM9HVuI7d0yc/AabXJ23lQu580Ng5uVA=;
        b=KuxseuYf8ahudiTkyssDYtKlr9EKCXGru+Lxcl/rA9U08fZqwM+zlRnSlcPuJuxKiu
         LYh3g+VhDn8mYtGRm5/VbOkQn+nvwNLZOR3BTRxjs9DZVKKJsKjK2IJoR6JYvu3ZvX4y
         iADRiJqdV3Ah4JCKVJlOcsXNpgWjgd1f/gk9bjyWFiUrKdSAhhCoUOMAM27SX22GNKol
         /BspzLMb9nrOwKdURdNtJqBQF2J1JA89XX+FR2/74VW2ZXhBjMQXrQUAL+b8PFcHKnvX
         B9dXZ8f7wXSpzltMg1c15vzE3cSHUVJSaZm3Au/CW3jX8H9bxfrR0yRp/aWEm8Ei32nQ
         nshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769970821; x=1770575621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ya5yGFEaw5toM9HVuI7d0yc/AabXJ23lQu580Ng5uVA=;
        b=M72bSoDLxmLrW59p3q9zcFPOP/Na6jmmJ+pq2tGxN+cToZyzREJer/XD+0oGdBmE97
         uaVPbafXO+quoCZKI3HkvOyy4wQ5e5YV5mH/2FeovkbdLK2dquJLYg7vXL6REJmRSyDr
         v/AVKYQ5gWdMR7Cod6asHpqYBAir4+PP+NncNETuKaeMF40LRqLT9IwKy+ecceCSKfKt
         QzIJrFo4raND9d9wURdm0ZiFANiuObtNXWt1LSyxqRclWuJMZ8bdO+A3wSs1BrPK7DqH
         LPnhUWDyLFt6xPdwjWKgDT2sBZjWMQKxb3As2HDHR3WqU7D4cxIdQe/kNXCo3x9FzuWD
         Yw3g==
X-Forwarded-Encrypted: i=1; AJvYcCW5KasvLR+ogywKMR/XsoLHcV3HKiSJDqz3pnAUILVYkgqrt52OnQxqJzTXIjTIpahcAIELM8AXbyRQBULjigAx/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvVfP6LShzHqVTxwFvDgq4pfHkkWAvV5nMDpVrf/fg3wD8cBl3
	5nqvKu3uXoVOHmxGPI2wAK2DwM2WwXjzWDTNbI6cXFjIFqs0mz4GI4U8QJyYD3fzAUW5QZDf1qI
	ao8ctvjA5EDMz98vkqkqkdcsLU7F91OE=
X-Gm-Gg: AZuq6aJ+jpnjRerpL0xuqV0ER1mBq7iWeK3UCR+TrT5jeGga9qvEFkvAp6WvX89HFBS
	lbwtzATL5CLURMJPzOSpoaAAIl9wk2WAdGBgcFmwA3hTj2Ns5ulNrz4kDe/9VJ30/IJ3pk4ROnM
	xY7LZVBl3LoMSH965hh6V5pGIK36VY9U5+J+RyM560XXncRdFHBNhZG0vtGKMDWHgrPUeehhXnU
	FXDhke7nqOI+oXaCX1Ge+PY7DnPT4Yqg3YBmuC2+nx3Z56Bmof7eyDvVEpGQUUju+b6U2qS4KuS
	tvoJSKwHKE8dCMn3jMyUfKFv8a9OtfJVwgc5EFrUuwNOk5K0Z3BQEOrOYdkIlRBr3wzy
X-Received: by 2002:a05:6000:1ac8:b0:432:8651:4071 with SMTP id
 ffacd0b85a97d-435f3a8873dmr13278042f8f.18.1769970820751; Sun, 01 Feb 2026
 10:33:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260131161250.5047-1-biju.das.jz@bp.renesas.com> <20260131161250.5047-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260131161250.5047-3-biju.das.jz@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 1 Feb 2026 18:33:13 +0000
X-Gm-Features: AZwV_Qj_oRyCrNwk1d4EkOcOrEcSe3PZ-OQGreA6B9xVWTkAhiCPU1GA5dw0no0
Message-ID: <CA+V-a8tj74WYJ=i5y4rg4OEtr_rXh381w9+s+ycn8qjajC4QxA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/2] net: stmmac: dwmac-renesas-gbeth: Add
 support for RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Russell King <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27753-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[bp.renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,glider.be,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,armlinux.org.uk];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,renesas,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,armlinux.org.uk:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4070DC6EB4
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 4:14=E2=80=AFPM Biju <biju.das.au@gmail.com> wrote:
>
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Compared to other Renesas GBETH stmmac glue drivers, RZ/G3L GBETH IP use
> the version Synopsys DesignWare MAC (version 5.30). It has an extra clock
> compared to RZ/V2H and has ptp_pps_o interrupts. Add support for RZ/G3L
> GBETH by reusing device data of RZ/V2H and can be extended to add other
> functionalities later.
>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Collected tag.
> v1->v2:
>  * No change.
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c | 1 +
>  1 file changed, 1 insertion(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/=
drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> index be7f5eb2cdcf..19f34e18bfef 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> @@ -214,6 +214,7 @@ static const struct renesas_gbeth_of_data renesas_gma=
c_of_data =3D {
>  };
>
>  static const struct of_device_id renesas_gbeth_match[] =3D {
> +       { .compatible =3D "renesas,r9a08g046-gbeth", .data =3D &renesas_g=
beth_of_data },
>         { .compatible =3D "renesas,r9a09g077-gbeth", .data =3D &renesas_g=
mac_of_data },
>         { .compatible =3D "renesas,rzv2h-gbeth", .data =3D &renesas_gbeth=
_of_data },
>         { /* Sentinel */ }
> --
> 2.43.0
>
>

