Return-Path: <linux-renesas-soc+bounces-29796-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAfPGAnXumkXcgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29796-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 17:47:05 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D48BA2BF907
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 17:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29A453434CAC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 16:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 169EA3EB7F1;
	Wed, 18 Mar 2026 16:03:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030693EDAB5
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 16:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849800; cv=none; b=O3sY4sIj3gFh6aWavdeGUdaP23WmuHVmW5Kdu9N+DavFGTwfuLn+SmbQvZZVLv0fR9iKdpPJzIf1/V2hhcDu5G5H/GBvzmkdFKpWjmYYiSgTqZGidb75qnoys4YlY00AY29vLAu1MEXi4tuFUExb9eInqrrbkhm38SHZKyzWNHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849800; c=relaxed/simple;
	bh=XVuxTIuxemn5HdUQiQr8DhvvEOWckmMMrPQjvcKJhm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jETBPG2LcQczfp+SvqAPsm3bobBLkmwHUX4gio9Q9pgFasTjn4uzdsqjlSzZ+HFdsjiHmsqM+Ixo1kOBkEIm78qDXjZ8rO6CPCr5AurXeTalhR2fRXATN1aLC/EwIxMoYkko0bcBOlLmYyphEUzQkhFRJOv+W3vShE7VOKscu1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56b1b9899d2so6425704e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 09:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773849795; x=1774454595;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uo5OHzsqXu4hR47Gp7Kdyr+G1caq7dBmUC13A5J+n80=;
        b=nwPh5r5cOR7zHhtLYa0h70PfZV9qywpaEUz0aYEf+6YUOx/F/HtqXxepexF//mmENu
         xt2HoBTCgiCUzBfnNm+yZfkttrcF124255VeRv+qoYx5bzJcz7OKJn/ET68lAewPoRj1
         cvINAKS+fMfQst/02RN0npsVmvWNAFYVSYK3yvNA2mNrvIprkT8BToS19f6k3ECHIUAI
         8SaiwFjPvrROGk9tUPHPelJcUNRxuPH+cj9UL8C/MMC/kGdTHmcXI1MFUELAXiHHDm49
         UU44eyNg94b2G6jZWoSyUGZDOf/g7LiOIvBsgvbJCvnFEFgmTiuOzYHaE3vvMDhc3Ofw
         qe8g==
X-Forwarded-Encrypted: i=1; AJvYcCWdDPDOSZW4+cU0zdJwKOAFFcR20y36TTIFa2fsjVRd0UZX+Pnh07/fi4FJ55qBlmtb/yC0mObu040fQ/qIdDxplg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlihM/KwUOrhzEBCaNza1z/uiD16BJgipx5CCCfh00Lkmsvoam
	OZ9Nc5SFf7ldXv/E5WqUWaiaIGp9ADds0m9uBS02PZYqKngRtjEhXgANONYvc/OsDLI=
X-Gm-Gg: ATEYQzzVVM74R7Ne75cmzI3621O9VYp2mW96FEEQuTqi3DIcXObMp2FcTH8s3ol0LUk
	V8lKWwNNhuGbNXAjZLbUj0rN6YAouq1booxQPUalUg1JA78FOHMCvk5LscPXFtXlBOZYBaCQ0o5
	Ethv6C35iUV/VdUBnY//7qpEXwne8EG/z/yZGvMOrJIy7fhuyHx6VUgJSrikB1ke4Pr4JF5DFb8
	7GcYWwQ8CAtX+sPsPOiLgBXQW7WCv7Lk0MAg3zOZQ+ZU50loz1XkwSGjJdYiEzXThuevXrJfl9o
	6UE0an02PNMBxtws/VnzBPnPuRy9EhckbJF9CwHdRaI9qTnPx99k76zMjqbBlyDZoGYfiY2urZj
	Yi5Va1uagt3QbMifSv0UorarppJ1QUrjDUwn7GzfAYaFUfXai1exyuV7dB8ZkmFF0hpgoqaacyE
	Cx6mFlnlxk8H0MOjC9OLY8j3hGDGLhQpofFKs7SP5b8YefJRy5YDklgIJwDQcz
X-Received: by 2002:a05:6122:2890:b0:566:2fc9:6c89 with SMTP id 71dfb90a1353d-56ba717c317mr2343197e0c.10.1773849794565;
        Wed, 18 Mar 2026 09:03:14 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ba7069460sm2083912e0c.16.2026.03.18.09.03.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 09:03:13 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-94e578a0fa5so3777789241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 09:03:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUG6tdU2OTvs7XZfxIUQS0l6fPkm2zNj830FNwYFUcgwngMO5OVWd7ScYOjlO4AIHOUeqBrwwzvukeuLz9+WqrrfQ==@vger.kernel.org
X-Received: by 2002:a05:6122:2521:b0:563:83b2:ef2d with SMTP id
 71dfb90a1353d-56ba71e7eaamr2380106e0c.16.1773849792902; Wed, 18 Mar 2026
 09:03:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1771344527.git.tommaso.merciai.xr@bp.renesas.com> <ca59fdcc6c32b8f6659aa9218f1a42d2bcd258c3.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <ca59fdcc6c32b8f6659aa9218f1a42d2bcd258c3.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 17:03:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-DeV5hfQAqK=ChxLATm+S1MjOsObYsssi4JFQmwn5Lw@mail.gmail.com>
X-Gm-Features: AaiRm51eNz-z-fsHN9TtWH7481RQArMChCwXzqF0AFf2HRP5BqKDYm-f9uccbZQ
Message-ID: <CAMuHMdX-DeV5hfQAqK=ChxLATm+S1MjOsObYsssi4JFQmwn5Lw@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: renesas: r9a09g047: Add entries for the RSPIs
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-29796-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,baylibre.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.120];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,glider.be:email,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D48BA2BF907
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 17 Feb 2026 at 17:24, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add clock and reset entries for the Renesas RZ/G3E RSPI IPs.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.1.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

