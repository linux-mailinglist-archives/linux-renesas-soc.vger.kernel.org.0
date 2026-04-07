Return-Path: <linux-renesas-soc+bounces-30907-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMWiGoDI1Gk0xgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30907-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 11:04:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E383ABB76
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 11:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 54FA63006449
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 09:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8D8639B96E;
	Tue,  7 Apr 2026 09:03:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD10739B97C
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Apr 2026 09:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775552635; cv=none; b=HDfsCvjb3xjXGmbG5Lhnlp+xX/nDRZeWLUAXabQRagPu9Iii0ofZ/bNn5bVaB/JnLL5uWMAOjOERDBkpyDGuZLFW4nK42lJ69NRrtxqQkNkWMWuAWZul/5V50D6m3wDAcRGTkPBG3vOyOSxa4IrJHxsRc8KICH+1RMwhun4bTAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775552635; c=relaxed/simple;
	bh=vR/OD3mUKC8xpJtZllM5WnO0SI3rvXcz9b+Z3xpwwk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s+jjdyLYruzUwQh2cd6OkIkYFbXMry3rI8wk+CNF5eW0HGXU0VQjo8FeU8b/ofh70eiFc2FubU7P0RPsuqOxfpmG/Fl9pXYsWSARYIXaK55xD/G3Tu/xZbZYagIEpPcqjB3hr2YrIfJA4+h1zHOwmO3Ft8JsbsHG0N2BT7ZsUi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-605def5b7f8so1267129137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Apr 2026 02:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775552631; x=1776157431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y0vl46NKGRyiCl8U/M/6ud6IWg1EyGptt9/bHQKZ9ec=;
        b=Aj4bCAgnCuPbdM6DgCHW+ErDDJQhM2JiCaxZ9DFHV6+yqQOKJ0Bd4eDC+uKlDyaq3W
         6Ha8FtXw0zx3Hi1ZaG08jB7n7GOzbmFqHFRECta3vQ8s97YfWm8zbQra2WBfdRN/9VDh
         Jwpo+BaohfNuU0Ff0xSk+CTnym46CajbgTJF53LPpp3MzYilsaHs/W+HsZC5wpm1Gc+O
         wPfJXKqmSl+Q0YX30geeleCKn1iyWlNhGf+UpGENLRSua3RoOJTpST3LNOt4oBndgzyB
         dbFpHkwjIPCreUC/tRIsGGH9sfYmS8qKE1NTpyK+XSejy1UAnUTOX9ziUaQW+R3qqGBg
         Rtow==
X-Forwarded-Encrypted: i=1; AJvYcCWDnxsUFwI63xLP68Ni/5MKtgBm6YNG4YHddD3U+60hcwueZ0ZC3OOheZJfb5+YTgN/tpeRiTnMFWTNp3edtJS2gQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxE0EaPQ3w/nlL+WK2QsBY24YwzUiJsZ9bge+1OTxYmgzx5QcN4
	CAeer3rtMt8JC8V6W3RiszRJ73VkBxCtBamAo/lOUriKH3kyqZGvEOd9S3eNJmYc
X-Gm-Gg: AeBDievaF+TVuS8+VXt0WGRH/QFzTGOGi2ElPCxXB8yjg5lVdr9szDki1srXH3MT7+F
	u3e4eE4oJ+xOcGX5eZJKFKV+dAnnM7VfnJ71bLhzPWiWr9ejKF6DNqkqvdBvhICUMq1rd3G7KMD
	boiKjQkmga0sXbvyxWiXXAaScS73z6IFnmx+IAgI4J5TyzUGcLyXAM7BISJS9R1T8+OZ5BhYg2B
	nuhpBbX35Aj5JsjNhxleTPo6RbV8c+HchD0SwzvaN3ExIzGspZp3aOLIhFsNlm59nBr+dTGBZdb
	elkoOoKKnH8jTz8lWg++w802ijntpnKsmJ2/mNeyvJVVGfXxQQyPLy1RvxDe4Lo9DFJTHSCQ4x9
	aDZaLJkEKNuGOBcdlTlMdSBUDIwq6WCCYX8pRlp4cR6nLJzETwFCO9MOmhAFFtYkaY5WmPXW1/k
	+3sNqURaYpCiHZP/p+RlPxFH94LtRBKQq9urJyyUYOXwQHhBn4fr208Kiyefz8ZGr5
X-Received: by 2002:a67:e113:0:b0:602:7589:6545 with SMTP id ada2fe7eead31-605a50f9e46mr5758007137.28.1775552631495;
        Tue, 07 Apr 2026 02:03:51 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fbb1a0d7sm14637930241.13.2026.04.07.02.03.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 02:03:51 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56739adfa1aso3735989e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Apr 2026 02:03:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwop2Jtr/tgEcwoWaxvObRowy0YgwelA1UWt2s9j09Nv83/IKehoUFPZvEMih2CYg0sRQOql2SnF16p/vQcKrQag==@vger.kernel.org
X-Received: by 2002:a05:6122:83d3:b0:56d:451b:e4dd with SMTP id
 71dfb90a1353d-56dab9c582amr5571250e0c.12.1775552630186; Tue, 07 Apr 2026
 02:03:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401183608.1852225-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20260401183608.1852225-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Apr 2026 11:03:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnjV=HGE1o08zLhUfTgOSene5fYx1J5GG10mB+Toq8qg@mail.gmail.com>
X-Gm-Features: AQROBzCmpfqi0EhIW62xO0TmPSVfhgL94wc_gDMbxOuCcTOVB0k3yzyfQ0rPbgc
Message-ID: <CAMuHMdWnjV=HGE1o08zLhUfTgOSene5fYx1J5GG10mB+Toq8qg@mail.gmail.com>
Subject: Re: [net-next] net: ethernet: ravb: Suspend and resume the
 transmission flow
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30907-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,netdev];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.343];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ragnatech.se:email,renesas.com:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: E5E383ABB76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Niklas, Shimoda-san,

On Wed, 1 Apr 2026 at 20:39, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
>
> From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>
> The current driver does not follow the latest datasheet and does not
> suspend the flow when stopping DMA and resume it when starting. Update
> the driver to do so.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> [Niklas: Rebase from BSP and reword commit message]
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch, which is now commit 353d8e7989b6babe ("net:
ethernet: ravb: Suspend and resume the transmission flow") in
linux-next/master net-next.

> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -694,6 +694,9 @@ static int ravb_dmac_init(struct net_device *ndev)
>         const struct ravb_hw_info *info =3D priv->info;
>         int error;
>
> +       /* Clear transmission suspension */
> +       ravb_modify(ndev, CCC, CCC_DTSR, 0);
> +
>         /* Set CONFIG mode */
>         error =3D ravb_set_opmode(ndev, CCC_OPC_CONFIG);
>         if (error)
> @@ -1103,6 +1106,12 @@ static int ravb_stop_dma(struct net_device *ndev)
>         if (error)
>                 return error;
>
> +       /* Request for transmission suspension */
> +       ravb_modify(ndev, CCC, CCC_DTSR, CCC_DTSR);
> +       error =3D ravb_wait(ndev, CSR, CSR_DTS, CSR_DTS);
> +       if (error)
> +               netdev_err(ndev, "failed to stop AXI BUS\n");

This error message is printed during resume from s2idle or s2ram on
e.g. Salvator-XS and Gray Hawk Single.  Ethernet (nfsroot) still works
fine, though.

> +
>         /* Stop AVB-DMAC process */
>         return ravb_set_opmode(ndev, CCC_OPC_CONFIG);
>  }

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

