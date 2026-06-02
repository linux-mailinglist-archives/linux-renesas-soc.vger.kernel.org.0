Return-Path: <linux-renesas-soc+bounces-33418-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAcuMFi5HmrZJgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33418-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 13:07:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3A262D228
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 13:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A6CC43053FE1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 11:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2EE3905EA;
	Tue,  2 Jun 2026 11:02:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239D33314C4
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 11:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780398152; cv=none; b=XbvE1IHV2wi85AMZHCMvKBNccmFedVxn+UAA1yWP5lEYidIe2eknz+LCiQ87+1QQX9mtSoo78fXtv2bdYBNW86mz03K+LTDjTLDGm7dudCM9+yxTMVvFwG1uKypRC1QVNO9jhjDEj8Hf0VQT9BbLA3SXQYTthfKrnGXnyHUtnzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780398152; c=relaxed/simple;
	bh=o+WhlPVAhKpzYCClAwEqayFJhPQsWilH+/WcLbTlrzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lOz0KWb8gwgNuqgpvN4XbyWYDOJ93bwDJL/Se2sM99QGfb/YeODndGGUBonlJo4prWWpCNE8VDqqcIVEAlD4RL7syjriLvXmKdsXiEMbvaDt9rRIOJtUt6/CEvUF7nZ57pfb0ELKuP70ZkE8isBKlWPgKHN0tLOLidGIkno3Mk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-68d234218bcso4674939a12.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 04:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780398149; x=1781002949;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsS2TtZW0aSl0juBsn3FAuO5vMHjnqdOEeqLykjHEtw=;
        b=WE31T9tD6ypHu7fNJ1LZB47lUqRaRAGJ84441dlN4lPOsVdjMrZN1XX7kgmLVPhuoj
         WZVcLmqQM4UDXdOsLrhpxdJRJ053anpiy676/tpkURGOZqTCtrCEkgZ+Wx796WhQ8sGL
         Jv9tU69076I5g+AO5hrx91G4+8Z57nfwhpzWyAs9G9XyaPOHZIt+iHOhcMMGwppZfPBs
         X+Y0ztIZq1app3f0SxXx5m7sTEXXEon/d79EDygbEyVjijMlrClpdphpP8XyzUCU9jRV
         raDb+0Vm/XFpHexVu59RaNH+fSZ1AsIN0PpKpJxhrB46hKqAjQuZz9EJzPYN9TEesdTm
         OXCg==
X-Forwarded-Encrypted: i=1; AFNElJ9Ebsg//BSDu5x1VbSKcw3IOv1DCMGCTcUX82FjaZq46oulzfxciQ5L4pgvXZiRrSbx1MIkWaheBORgzsqzgY1MMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzX/K9hPnrgyyJpE574RzBwZHfUGFZpetV3Y15x/mN6xu5Migj2
	bYnfCzeR58pRBuxc7459vuZJmMBzcQ+MLzjyINscoBOq5egWOdhrr/+LWYkZruVFkBU=
X-Gm-Gg: Acq92OGlzZ3J8rw3afwOMop5NM/X0NDgzbuDrIM80sdZrRbtGea9eYzfyH0/HLyMf20
	Bz7hFTCs170n7zZ4hWbGjEo6mOlhC9o5UwgfeHKe1JLUtmELBCqmwlsHCP2EcWneDMrLi8ljbWS
	0wuiFtP0j+hPWyNNDRLqpSCYFLdT7KiK7KF4849fCYmo3alDesh8bI+0slkux44URoDthpk/KNd
	atwJD0Sbfs5JPR1yhXQhucrHdQFalYkEmIZmYbSzNTUBRGDJkbxqmVvoj5zCyNBkcEcgxniuMav
	wb46iwogezKkIWgAcITdvnQ0Qi1ORAu7L0innJ3B2cMc5N2MVG8pV+c87kDOPBavPe66JhVz2r3
	aygToGpS04xxI7Yn2Sh75WpmOrfTWOpjcnuqxKT5Emz+aiJhJaQqoiVzC7nmfqgcrIQDnknMaY/
	xCrNxcefcjkYElHjpbw7bjJMpXcAVqUjd8rupIUnmmuQk1a4bcP/h36Qpq0fjQBxqzVxFtuC3qd
	9U2hKBUpw==
X-Received: by 2002:a05:6402:a20e:20b0:687:1c98:a19a with SMTP id 4fb4d7f45d1cf-68c8a65775cmr6156988a12.13.1780398146869;
        Tue, 02 Jun 2026 04:02:26 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68ceb870f77sm3276727a12.30.2026.06.02.04.02.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 04:02:25 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-68b73f1a8ebso8679524a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 04:02:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8zXY95q+BwNzJM8ydzebxRe+5WkFYm6HTzDdBxDPnOd6CttcAO/qZTjYSrb7AilqsvT/CWKwoz/hhvt+3njytoqQ==@vger.kernel.org
X-Received: by 2002:a05:6402:2341:b0:68c:3424:af6c with SMTP id
 4fb4d7f45d1cf-68c8af0be28mr8197350a12.20.1780398144162; Tue, 02 Jun 2026
 04:02:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529130704.327505-1-biju.das.jz@bp.renesas.com> <20260529130704.327505-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260529130704.327505-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jun 2026 13:02:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqX0nbO126qkZ9d3Q3dfybGxuoYheh5HQznvbMVF8oCQ@mail.gmail.com>
X-Gm-Features: AVHnY4JjPVZ175DY-spdN4lfI_UThiMlobV81yGcDvskIr0XOywLkltq_xABxIo
Message-ID: <CAMuHMdUqX0nbO126qkZ9d3Q3dfybGxuoYheh5HQznvbMVF8oCQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable RSPI2
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 4D3A262D228
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33418-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,renesas.com:email,mail.gmail.com:mid,glider.be:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, 29 May 2026 at 15:07, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable RSPI2 on the RZ/G3L SMARC EVK board by adding pin control
> configuration and activating the rspi2 node.
>
> The RSPI2 pins are shared with the DPI display interface and the
> two cannot be used simultaneously and it is controlled by a switch
> SW_DPI_EN.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
>  * Collected tag.

Thanks, will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

