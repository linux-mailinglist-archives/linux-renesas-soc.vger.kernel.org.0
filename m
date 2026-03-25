Return-Path: <linux-renesas-soc+bounces-30213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMRRHWG1w2litgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 11:13:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE33322B1D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 11:13:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BA0F03016B80
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 10:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DEA3A7F50;
	Wed, 25 Mar 2026 10:13:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C915E3A5437
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 10:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433631; cv=none; b=nG8RrO8RbmMd6c9oSeUIbqPKIZi/9jOEYn+K8uy9x47674OCYlB6QddBoxNJjIQp2kaL+GYypfEvQusQnDSlovWV0w8p+ld+cfPcMWRa6dThh8NFIvC/KDrlz2A5/LPybybkUArXcEUYEKLKVs2itrwOMHXcb9Uf1nReSiUIgig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433631; c=relaxed/simple;
	bh=d10Wzuq54/lvVZqTRXUFEqKdYGcg4pnSSJK7jHjepFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FAhaLh9wtf6du84wpxRwQHP5JkB2cgLS1asZHk5qT18SXH49Azk8UiS2IuYmsFl0ws0owhZZglTyYKsOt8t0YZr135WyzGa64rkTKpu7277/bU8O6xAoharDvKLTVgKedOv89KOcFvrWyRY/gU/KirwrFVFVxMLnnnkZPagcUcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56ba039eecbso1996036e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 03:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774433629; x=1775038429;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDaG/7sO/tQakw0RmIEn3KICwhpxzHUr5uWeZRW8Hmw=;
        b=cm7sf/m2mRaWZ3dzMypfacqul9MLsAtUEHMtXijIbYomFhSAo7qZKWcFIz1CMsQzFh
         3TAwKnOvb4xLQY7IL8A9HyKgn1VmkjGXorpfyUxuSFwzsuf+3fyehz4pk1YOv7F+qVY7
         1JfKZPFaNgVS/qLpySQa1THKBMX3/U4PVUa6dYnpnfbituWt7sZb/rKijWQt9XF7uN+B
         kmEyiWBBgAUeetk6siG383EmcJN/0mIcEggBnnlVDGb3xb6vEudYOblEWk+4oUJDSdEz
         vppKH0q2UM64qgiqsl1joEV5ZrlIqoW4ESRUai5TIYNeJugGBYljGtZ+UkcrnjBxGgob
         /N7g==
X-Forwarded-Encrypted: i=1; AJvYcCVsXty17BeQPhiKxaLS6RG60rxUwslUf1nAyATBItuyQE6Vk7W/i31J7XjUJEdkL+hIKIrT0tLm3tq7SaDptIKZSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIlJEhXr16fesn29RwBjLn2QtiBs91Am1PeaIt3RwjzkmMbssq
	zX8QypxF7/mMyryCXEhVurWaEKTTTjcRvlbXm6HbUcpNZsEqJYS2iCOt4BzMqaKmr4g=
X-Gm-Gg: ATEYQzx/OBWl6l+9CZCNdBsTF+eXFI+2+S42VDMjF35INZPgpO9neaxlIrnLxKogdFo
	tWvjQF16Sm69+b0zGi5Y6utMgjo7SuPyNhPz2aOJy/0VlYlVzn+z5f/cw8/DESd7UKAoco62eWt
	0syZKG98fktLjDokO7mov2ooM+egHlVfvkW4HpP1fHx1cWu4ZQ43/KZfFeHhngF+FJixSYAds49
	PXQNNOJASTdBmRbQenOqbSwQ9OzL48dAf8Pryodr3Fm0gtFyclk465xRriacojM6hry1409gYyt
	VgEXCYekOEC0Tcm/E/9IzV6Z1heDDLolSSm5vD1p3sfN2Bn7ExWE7oWLtb43uyyfXmFZGy+XfVW
	jibnXkUv5jmKVgSMlcxUCH0ey5P/zoJNuNgCchJ7OL8RM5cv2ixHHGXUj+2BwemaNRj50co46so
	4R8bIh5uWiKXYVvZqbXtIuRodlSb7QDBvRInsaHI3/k/ryAteZUKDZLOrTHV4p
X-Received: by 2002:a05:6122:d96:b0:56a:9841:9f81 with SMTP id 71dfb90a1353d-56d21f50c1fmr1467365e0c.6.1774433628624;
        Wed, 25 Mar 2026 03:13:48 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddc7f877sm19587354e0c.10.2026.03.25.03.13.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 03:13:47 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-950cd03fb5eso1706218241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 03:13:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9aNlVT3hGdZO+tfd2Ir2sGN3NdWSAn0OFEyd1K6JD/olnP0Cuuj+hShUFMrf/buuAA+4k3roL9jU/ie9Fi/IkVQ==@vger.kernel.org
X-Received: by 2002:a05:6102:5091:b0:5ff:f516:a2aa with SMTP id
 ada2fe7eead31-603870e0d2emr1309775137.12.1774433626857; Wed, 25 Mar 2026
 03:13:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325095718.388157-1-herve.codina@bootlin.com>
In-Reply-To: <20260325095718.388157-1-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 11:13:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXp_ruuv5ap1onR7eSc8zvnDEDPjUu9FPsQbFzqCRC2Tg@mail.gmail.com>
X-Gm-Features: AQROBzD4PFt-v9V-tVmsmIWbbuwIBhiLHVDtgtW23ooqR9mX6RydgMF4Wv44TKg
Message-ID: <CAMuHMdXp_ruuv5ap1onR7eSc8zvnDEDPjUu9FPsQbFzqCRC2Tg@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: r9a06g032: Add #address-cells in the GIC node
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[sang-engineering.com,gmail.com,kernel.org,vger.kernel.org,se.com,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-30213-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sang-engineering.com:email]
X-Rspamd-Queue-Id: 5AE33322B1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 25 Mar 2026 at 10:58, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> When checking dts involving the r9a06g032.dtsi file, the following kind
> of warnings are reported:
>    Missing property '#address-cells' in node xxx, using 0 as fallback
>
> Indeed, #address-cells is not present in the GIC interrupt controller
> node.
>
> Fix it adding the missing property.
>
> Value '0' is correct because:
> 1. GIC interrupt controller does not have children,
> 2. interrupt-map property in PCI node and in IRQ mux node consists of
>    several components and the component related to "parent unit
>    address", which size is defined by '#address-cells' of the node
>    pointed to by the interrupt-parent component, is not used (=0)
>
> No functional change.
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

