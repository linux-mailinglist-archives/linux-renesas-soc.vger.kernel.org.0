Return-Path: <linux-renesas-soc+bounces-30354-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLBsIJg8xWn/8AQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30354-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 15:03:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D839D336777
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 15:02:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 778A630221FD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 13:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A222DCC1C;
	Thu, 26 Mar 2026 13:54:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85AD231A23
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 13:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774533276; cv=none; b=R8fy9TXXUn2PME9+W7C4KZB/y66oy4IhkT07HAUCYGEM2UoSCnFPpxPfQJ8WKmkbbBQxDU5V1/sn3SULFEHngkViEnG7vo0a4cBd4qYcIWUYyc6zRhWj54+B0dkogRi2qN3nCdCbB+kDKL8hk30YuwAGD0a9/0KoB3p0et6NXYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774533276; c=relaxed/simple;
	bh=n+IoVKZyXzfwVRP79foIQWI7Ic4EcTRiVVFSaOF4VAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rnJU1nvUO1aJ808VqGal90Bgl+h2Q0QJqq2WnyU6YTXqQ0gS/RpC2HxgxV0VKNYF831/5e1gtpD7AALIZUPk4T107JIbhUJV4veSanSoPOd+85Z74grAgMTLpMg/kGyEKTLkI2jBbsQzxD78Ogd0Frxdwy7YHjtn+0NmPakuwVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5675d609621so892568e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 06:54:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774533274; x=1775138074;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxKOWB+sopeCZdrnaDe1kIehHG9U+NV49ggY424fFLY=;
        b=DcfmDPhUTwaVofMtcu6iVDz7ocl1uLoV0LLb2bHrxO/BQ0OiT0eirg2SSJgb+GOwtq
         9c2Zeu7I3XSkLWkJd6nFigebW04CrwNkm+2CdVj8CFWXNkQ+Xy+GzeXUqqck/i4Kfdqr
         Fz+qRYf3cgj3KZotsq/r2cZ9CLXPyPv5y9gEH3bxl51mISfzmkJs0ZAH1q1Ed+gEPNUz
         2a8pjjZ8ymzbbP8kE383FH4LZ3KvG9vjzXUHwpwQkjRPKPHMlCdAhPYViaKrFEenPB4a
         YzlWkwWGq51EwM6a7Pso8gvW39qborLTGr2OFtiCzUSw2f57NDZw9Vle4bcQi+lLVKLk
         2gcg==
X-Forwarded-Encrypted: i=1; AJvYcCXV7uMGuuGEGonW8Q0VD08FF+okHJmSr6l0zcskRqWQlIpy2yGx7hYyf6JbdGKzzy+8P3bdvNQi3Y+wKIhyCFLceA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8V4zhIs55rrtqZmWwzSuV+XhYwsTkiWESuG9+voGKloaD++t/
	yDX+BwjFuFPowGxfYbaOyOH/GjaSZYwZqYZNRtrhYrFIUF7txg9ccz5GlWx+7pi3Yu8=
X-Gm-Gg: ATEYQzxKIchuwkq3Off+HbNcNUjuUWxDf69hCjuDYc8x0O4fxQ8lOiqfS99H3iPAkGm
	QfphsDt/dJVMO0eJmqI6ORgJQjfXI7X6JbKaRn4S1HvRKkl8u+v0jXIIYfH4DAK4dCoOG3PFDUq
	srcoxom/ZWUnKRDnmV04giRxDOOPWcNJ6qtejM85N/lOQvLSjQRtWqVSkWlo19DViu3MfbO2w1H
	yEWlk8IAyIf15UVZDW6T4zOkWEICDpUB3qGfPuV1ADQJqcI5KzX2odB7/FDjwmD2NkY6goVqrQE
	6qNc4TYhwkTLT0P4Wz9Z/TS6/6514ksKnKPpnytw4dBAcYLfNBzfitoRDn5Od+EbPuis8azVXpG
	Ik/Xvj5RFneJNExkHw6McVAIIw1QrK+un/4TJoKH2QW7P+mLyPmZ+GA3ZaVbnCIR9CTS+hsPm0h
	xQJq9iyjqb+/NTzC6IHNfThH/lG2Ko4If8KxyfvtJ9iiHy34a+JOLYVm4hPSwU
X-Received: by 2002:a05:6122:4f9a:b0:56b:8ba0:fd6a with SMTP id 71dfb90a1353d-56d21d07a9dmr4063344e0c.0.1774533273801;
        Thu, 26 Mar 2026 06:54:33 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31d71725sm4543755e0c.13.2026.03.26.06.54.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:54:33 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-94de88e52e5so600165241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 06:54:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6R/6e51vD5yrW2QhrVR5LUQ2no28Af1wif1QODqAPAKzKuxR/jeJytxoBN/IEbR4uIWZYYgFvqteGxL1Kh2zPbw==@vger.kernel.org
X-Received: by 2002:a05:6102:9d8:b0:5e5:6eee:8adb with SMTP id
 ada2fe7eead31-60378fe5955mr3525533137.4.1774533273108; Thu, 26 Mar 2026
 06:54:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com> <20260324114329.268249-10-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260324114329.268249-10-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 14:54:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUcabM+GJDW==1gJhp7VixhfGcbKmnCk=Xb2nHYeVjFLg@mail.gmail.com>
X-Gm-Features: AQROBzAXSwCW94iRNngRUI5RBxA6slGDmJTH1iirhWeLXC8HmqPrXGLH1JhFPis
Message-ID: <CAMuHMdUcabM+GJDW==1gJhp7VixhfGcbKmnCk=Xb2nHYeVjFLg@mail.gmail.com>
Subject: Re: [PATCH v8 09/11] arm64: dts: renesas: Add initial support for
 RZ/G3L SMARC SoM
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	RSPAMD_EMAILBL_FAIL(0.00)[bijudasau.gmail.com:query timed out,geert.linux-m68k.org:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30354-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.234.253.10:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: D839D336777
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Mar 2026 at 12:43, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add initial support for the RZ/G3L SMARC SoM with 2GB memory and
> extal clk.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks, will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

