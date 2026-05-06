Return-Path: <linux-renesas-soc+bounces-32143-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MM75FoJg+2kuaQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32143-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 17:38:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F6F4DD671
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 17:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5A9FF3000B00
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 15:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB30A407584;
	Wed,  6 May 2026 15:38:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C473CF68F
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 15:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081918; cv=none; b=gczVMkKxPAg6IWaRbgpvhzp0t3PR+xPVy+cqxkTckbZLSCLplQxr5wGUBxRszbVz+rzjF+olZ8TkXS8O3h/ugP1tic0i5p3z5QTidF7fdgLNlDvywUJBIcBbUiqzy/Bo37FXefgxU7EcPOAipKXxRUSAnJQoodicDPXJET1/G/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081918; c=relaxed/simple;
	bh=mK4RQvudzSfHDKsOsVoyt8Iw5IZ1HXhGx8SNTgh8YWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZHX3MyMSiaQzZuEc3qEYXEV2cfuW+AgihzAlAZ68HTB1C2+EDryli1rp0UHFtwkv/+gnMTOvtteeJedTUFR0Ad9YH+ggy+mmI5XdXfrJ5Rt/INbIG2dc/krURJCWmuq0RIuP+fCNMuvL0TLZ08OWLrZIAh+nJHAzBdinXTkxLwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-95cc3522c40so4131992241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 08:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778081916; x=1778686716;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uiPvar8b58lM8s+EHxxzQhZuLn8K6vNLqEMxBWnkjCU=;
        b=o79Ljjvq3nnF0GLkX8Q5+9hsOPI7861Hof+NLYDZg+dDV5hiCEt/xhKMlAG8JI2d1s
         tYk3zq5/uf/7IRicv1pM1zOEvKJNCRw8YHNMHorsJRZKgZOMBDURnnAh0vonJDSN3m8h
         /5zG7A87CvMEliZrjGAp8kem2yh/TaFwa3h7IrPtyxJ8yx6XqNnntzIlLS+rOZycOq/5
         n9BYS6ZrZAuEP/rsJZU4pOE2OFdw5DMU+7E8FHF7u1wT+MfsQaA2ON35/4WZIMS3JX2s
         EBFw0sYt+J+8r3iArtmp89suGsaoKm1CUaGSOamzImy4KJIKy0eCNx6eY1dPmLZZ874a
         L6rg==
X-Forwarded-Encrypted: i=1; AFNElJ/ujMtEH54GkeaHb17R+xVjyO9NJw+cb7kLN7tCLzLWoJbJpX0R8cC5Q9/QLIXxl6lJbeD5w/AHAH2nEzYF5MEp5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDotZsq5adrJ9iagoNaCRAy8IvJYE47IaK6k3zFDcIjDvXQEB+
	aQyVTv2Qu/nDVqAHeLwODmurrGKSOmIBp5DOw4xY4wdXlEcYg1U2moebc+rQ/fq6LuQ=
X-Gm-Gg: AeBDietSp5zfERfl+sZ8xDqM3LMArhqYBbpq0Zts2KSB5m9WUbSDhkSRvUI+Jf0KHQl
	jAXZccw2SveVPbh/6xKvHbxya/UB5K4OeeGbhcssbORLqUvWSSdx7K2OsfP6gCPq4cGesALTaQS
	fkTxacjbULy9295irAYoZ+qVVvAOYaxWnvF75flRAhsb2biWPE1BRaSpCT4Q1rchexTaOLhKnnL
	OZgGCx5af2VuyHZyXneMAVATJiM+Cxixu65M/Wbtl2iypJZsto3lXDODk+lf+j5ici7OzxHw2xN
	MlksSryQU8NAVSm0428tCIKA80lIUunlMgu1BBdCQqRjHXg2311LWtJgMjqTyzd90xU13XPHRYz
	IGNUd0um8suyielZ7DLAjQiFpBSoRrClI+ouUfLt2zYweK9EG4iFVfHXCyFWPikfZwgoBvSF/Ny
	1GPLcpBw9uZ4WGD8sbgusGSnL5MyHrpWc3tC/0WCnguat9b/T8N6D8/ILZWA8OsotS0uFCvNQ=
X-Received: by 2002:a05:6102:c0a:b0:5ef:ac78:3c77 with SMTP id ada2fe7eead31-630f8fdce67mr1951110137.18.1778081916361;
        Wed, 06 May 2026 08:38:36 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0af68c7sm9361376241.9.2026.05.06.08.38.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:38:34 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9568159ee07so4192854241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 08:38:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Xasw5Y+VmPK7Sn4487fwD3VIR7ICi2O6N2fXayrYgkb4WACJTg9YztGtWmKcXUx0rq9PWkSGMp/gyWN0v0GlfWQ==@vger.kernel.org
X-Received: by 2002:a05:6102:948:b0:613:6b44:3fad with SMTP id
 ada2fe7eead31-630f90367e5mr1751467137.25.1778081914401; Wed, 06 May 2026
 08:38:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430093422.74812-1-biju.das.jz@bp.renesas.com> <20260430093422.74812-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260430093422.74812-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 17:38:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUQonMKppURhOpuewET5v9=dqqbywtRzn5jNBqPdFFuQ@mail.gmail.com>
X-Gm-Features: AVHnY4JsU8xfdNxfBXAX3UweYeeFn-aNk8d9aeafTdrWsa0-SJ8O5YDm2A2HTXw
Message-ID: <CAMuHMdVUQonMKppURhOpuewET5v9=dqqbywtRzn5jNBqPdFFuQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: E6F6F4DD671
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32143-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,bp.renesas.com,vger.kernel.org,microchip.com];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,microchip.com:email,renesas.com:email,linux-m68k.org:email,glider.be:email]

On Thu, 30 Apr 2026 at 11:34, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add documentation for the pin controller found on the Renesas RZ/G3L
> (R9A08G046) SoC. The RZ/G3L PFC is similar to the RZ/G3S SoC but has
> more pins.
>
> Also add header file similar to RZ/G3E and RZ/V2H as it has alpha
> numeric ports.
>
> Document renesas,clonech property for controlling clone channel
> control register located on SYSC IP block on RZ/G3L SoC.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Dropped Port P4 as it does not exist on RZ/G3L SoC.
>  * Retained the tag as it is trivial change.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by renesas-pinctrl for v7.2
and renesas-devel.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

