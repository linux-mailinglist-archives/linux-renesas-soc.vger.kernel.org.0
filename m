Return-Path: <linux-renesas-soc+bounces-30260-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHfyCA8NxGk+vgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30260-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 17:27:59 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 769C1328FA9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 17:27:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90FF631530FA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 16:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC113BE156;
	Wed, 25 Mar 2026 16:10:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0013EC2FB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 16:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774455000; cv=none; b=DPEVI5sg1nD/aCQh2Byv+M9AJb9SZjHOowLSL3CAgVYEU2AhFrxoCBav/M/mOhZnqF0bT3pyqLjDMjRLkYvsMcAPpWSQtgQb19hX1SxKZclGe1sE3l9rayGAmVyYYG0x3JofHEgLPX/zm05HAbB94Qg929Z0TaGDWKb7+qL7MiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774455000; c=relaxed/simple;
	bh=V9EhkXmHhCfd6mpQBTgvR/U5ijzRrAw8mhQanHksz6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iccHM6hkfsM3vzppVtl/Rr2ptC6+M81e6m+schmvPIwu71SOgDzCb5e2TVxqJePHxdielqKyna4mzJP84IC/pfRNZtSLR2w/95OsHCQJVZ9bzdaymLIKgo6+pBsxetQLd4sE2Sg/RaGploppzdvRvRdhmBzlG3dkeHss98LC4+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79853c0f5b9so46748827b3.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 09:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774454998; x=1775059798;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZPS9rvjiCNyKh+pIYFKpxEAkHK/vWQ91zf2PSXKLkY=;
        b=ZtGKKPNAzn1qJxkKsDxGs71gdrpORVr3vWe7jQBZV1bcmu/68EZQHZ/2QHfJ71ZdOt
         CHvJUZhE6TE0HFy9BKZTXsN7J4ayy8F0uI/vV34+HoFYyFAg2eUDU1MZKKlLRI/dFh+R
         6yft9wb920yprmLDszPKElFgYzaThLAfmsr0PfRnKBr8mrx+HMsH5rd2r9OBpip1gZhC
         FZ9C0iYzLds5vJmgPf6ToEkroHINJg1c0sxaXrTfbhe5sl80oKxPzZpTu5SXjD7FYpn5
         ODQUy++AcYYvgdMK/pI7X1H5QlUhtQ61UTlkaMx8AiB5U2QSusKSMWZVSuqSshTR1BuI
         MjCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtdvnJnp1NLNX32Iwi1TMS+9nIpXK49aszgocot+gsQ3LDmVFDTtcug0zyCAnAWC/n5LR13mTceR+uFSx2oUL9rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFIr07Y9VXuRSSV6JbQqqv2ItuMvTsGivwbQ5yNGjqMLlcK4lO
	Z9KN3uSaDv0hZwGAvsb5N3SD2UuWLdw/RAp/Mn7y1DbHkAjaA+Qucd/6O6rQeHXU4xk=
X-Gm-Gg: ATEYQzwzkz6Ha5DoRSzmTRNLgzaxFRkUQ5GyM877vSIXlaUpE71yjdQ1a3byopDhmpw
	xd0VNot3bImeObfgM+/qo9DZkBFAiCVBnJYtp26a6pRhz3TFDdP+dxh6FIaakPgUt5re+laxRAx
	njfX0vocTDRCvqMf+h0Ezv93BqJ25BGeoVCfUuGLSUyzdGUXwuXYTq/a2aqg8tiyWeOvUr4wERt
	FatAkCS4ZElENMvDhaE8WCFTbMQXOBS0p7pnzNVpODb8xG2Ia97HPDbSQCtL7U4EsQS97F6qiTz
	jGGdUQesYriih4TGQ0AkkouqpujyjoZF+jMvRKvO2g/9vkJ/8zHfvYQ4HQ37aJfDQmUkU6gyabq
	8ytdMW7Eelrb2S1TfVrJ89clQQV4vHyeV08Ekent4ZZVpkKUiKVnbLjL3p1vLZdaHOVHIjjNHEC
	2jhUfx4NciJEdCYSeJ6xXXIzQp0Vvg+QGCp37KERON0E7yN3ZScU4koQJo3hdIxZxgRyuyd+QiK
	4Q=
X-Received: by 2002:a05:690c:39d:b0:79a:b9a5:9e90 with SMTP id 00721157ae682-79acf65e49amr43981967b3.39.1774454998515;
        Wed, 25 Mar 2026 09:09:58 -0700 (PDT)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89cd5884166sm952176d6.13.2026.03.25.09.09.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 09:09:57 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8cd8c6e365eso10629085a.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 09:09:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV7IfbQ8DQ/oYk4bA0i7dvFUMYTKR9dP2rHK8aTnBRLUjdsZt4Q3Ryk8Y/HhDAiLkA2dQbjjKBb96jqzMrJUx67wA==@vger.kernel.org
X-Received: by 2002:a05:6122:4f97:b0:559:5ef5:b196 with SMTP id
 71dfb90a1353d-56d220c4f8fmr2065624e0c.13.1774454526013; Wed, 25 Mar 2026
 09:02:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318085119.44717-1-john.madieu.xa@bp.renesas.com> <20260318085119.44717-5-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260318085119.44717-5-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 17:01:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUPvnoSVBVKFOgXFrOyVK_CDuiNXZ44v_FYkEBtYKEhOg@mail.gmail.com>
X-Gm-Features: AQROBzDAUOx_p6wz4xdqborLEdAuZA8hQ4cgzmgeW84NqoNOTvQEgITg1E2ITKk
Message-ID: <CAMuHMdUPvnoSVBVKFOgXFrOyVK_CDuiNXZ44v_FYkEBtYKEhOg@mail.gmail.com>
Subject: Re: [PATCH v9 4/4] arm64: dts: renesas: r9a09g047e57-smarc: Enable PCIe
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,google.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30260-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,renesas.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: 769C1328FA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 18 Mar 2026 at 09:51, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> The RZ Smarc Crarrier-II board has PCIe slots mounted on it.
> Enable PCIe support.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>
> Changes:
>
> v9:
>  - Renamed gpio-hog node from 'pcie-clkreq-n' to 'pcie-clkreq-n-hog'
>    to satisfy DT schema naming constraint (reported by Biju)
>  - Updated line-name with proper signal name on the board
>  - Fixed node sort order within &pinctrl (reported by Geert)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

