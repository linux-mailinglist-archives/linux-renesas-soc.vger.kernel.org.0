Return-Path: <linux-renesas-soc+bounces-33013-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEZEIyZdEGqDWgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33013-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:41:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E83135B55D9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91DCB309DB8C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B9553E16A6;
	Fri, 22 May 2026 13:35:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14DC3D7D6B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 13:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456948; cv=none; b=f0zcRAvpGeX30SEcMd/QURPEAehfZVwY5ioiB8j2uhMVgdU4FrZMrW/JDfKmQ5chFNUYL6K0Lft5U7P6CfaWsy+ddfc+Z812no9V/JJ5EecaTu+myIrHSsIg+ZUSf3+AyD+VnVrkQVfRoo1n1sPtmZqZRSjMx09xhE0MpjvWx+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456948; c=relaxed/simple;
	bh=vaqLOkMoYJwQx3iV6i+XeHN7SxyVOeCzD1OCLEMqT/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tyLxlZhuvM4aV82A5lVzKyUFlX9BDBbcji+oUgZJnDn6bQuxjMq5GqcXLrQLz8rUZuB84NCccWuS++yW/hiVqIa1hJ1J3kO2DEIr2kEyXaqPW3Q8xNLZawj9xnT3APGOpvsDyC/kVh0Cyo7nywqAgJmbx4jwT1YFR5FaFBYQqxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-63169437ac7so5608688137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456943; x=1780061743;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXlWSxNo1+Jju4boSCWbL7pXl0mOxwBwkZSG18gGaH4=;
        b=rl7wTrlljN8/ieXtwbvJsxtUhyPLagkHytdcCZGEmsHr87xFGkYJwunGN/SAhttfli
         Ie1xny9v662zOijrzVveE56+wICo3sxqJ9yAA+Es1PF6b+Z3qBaSJqklgTbwyxqDsbPS
         9N8Uik66KziJrbSgdkTq84qE2XW+oMk23B0W3BtrGgxYqQrnkxWn9oXX0u8oGQ/PBPc6
         eCkcNbaQgcKvZ4csM0mZZa00W37vfXo4UkEcuntzfdVl5sttVP2gOfrr/ZY4LFueGU9Z
         MzhMI/IY3H0CxCLCxBbRVfiqWg5D/8sZ+h47B5Z4ZJRmGbnP4SOz/FyDcIbJI72cNmsK
         jltw==
X-Forwarded-Encrypted: i=1; AFNElJ+0H0jWRn2XKX7vWPd2NFwJup8DqPMCEjqP1yH7mB2LffLnrw0cSR49ZIjuA3hUYh5QKmxS1vhyf6Lxxn0ebBA+1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwamZqpJVO/0ETbVnq5a/4JxBcpisjVpmQhXmTrrRVTc9Tfdq8+
	sLl3LJjFp9aUCbFVLuUVfAYHmNCInzzI7AyKvccaEZ10R0/EJfeAsVFJW3JeffkVqkk=
X-Gm-Gg: Acq92OFaBLrpiqlSyszxqqnyX4VUnMKhJi+jtEkfpviNaX2eNDCCDZGzENX357UzMqh
	ClplWU1HS3/YGyo+aIV/CIx2l816fxhAGhDhZfLcdLPR1eQLwXKeEqkFtNR4oIchpO7TbqWrpWX
	6aInfk3f8fQmvlzIFxw/Eq28zw8Rdo+jMiHBBwzJuY+lDrw0a9ZTFjTJQtA4y4mQK7IlojG3uxw
	rtxRaVFSrgMX9GMBQcZVXQJmKoyL4uMt+f9IRdmrASrAJ/ErVnRuIJ5TzhTtriZyN1LOTl5q/1S
	IucOcoViwmgobMyJXs6yWCZXRwlSeKcyVzi8YungIe6PrPlgLug7vnk8yuAqmAt4snDWW5ruhXk
	Ini/CrYFy9oh5XGulaRjeyIma8PbnhssLOTfAtixWPSnDgdT0cpmpGFEFkgFQfTfFWwh/BevZO8
	n5uTy2QGOGVyB1ND1cm/ljqJTYcP/Ql70I644wkBlmC/ML45vM508HHmRF5IxvawXREEYZ+2Y=
X-Received: by 2002:a05:6102:3faa:b0:633:4d1a:65e4 with SMTP id ada2fe7eead31-67c80b74b45mr1960864137.12.1779456943226;
        Fri, 22 May 2026 06:35:43 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67ff5f0820csm1329240137.11.2026.05.22.06.35.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:35:42 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-95d3492fb1eso4635268241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:35:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ytDQouoZu+FowX5zEOL2fSl6u706cnQGVINfT5zKwkySl5RO/gDxr+w1DOXWezx2RtOuf4SI+CO2bn4qaUio2+Q==@vger.kernel.org
X-Received: by 2002:a05:6122:3d0e:b0:575:22f2:a1f with SMTP id
 71dfb90a1353d-5865f726da6mr2063094e0c.4.1779456942694; Fri, 22 May 2026
 06:35:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506155804.3984418-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260506155804.3984418-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260506155804.3984418-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:35:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW_hfAf+x1nCxpYOn1u+9Qf5MZPQ4OzcZSqQv=C+mQeGA@mail.gmail.com>
X-Gm-Features: AVHnY4JM24tWXTYpQSwoVZ-HgSC050JGtKsRm6hbb0RSe9rOvyacCgB1um1nmMM
Message-ID: <CAMuHMdW_hfAf+x1nCxpYOn1u+9Qf5MZPQ4OzcZSqQv=C+mQeGA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add
 alias for on-SoC RTC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-33013-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E83135B55D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 6 May 2026 at 17:58, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/V2N SoC provides an internal RTC, which is enabled in the DT.
> The RZ/V2N EVK board also includes an external RTC in the RAA215300
> PMIC.
>
> Add an "rtc0" alias pointing to the on-SoC RTC node to ensure a stable
> device numbering.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

