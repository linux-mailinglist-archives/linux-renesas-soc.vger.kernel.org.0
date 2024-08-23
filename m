Return-Path: <linux-renesas-soc+bounces-8135-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D83E95CB29
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 13:08:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 178F61F23817
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 11:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FEE1187345;
	Fri, 23 Aug 2024 11:08:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48333149C46;
	Fri, 23 Aug 2024 11:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724411330; cv=none; b=U9GgjtGOPdDOlSDgRB+EcTFvEiVOLjZjph6V8L6xacsOB6m8LAcDyUvva4O4/46FSsbA2waUZXsqKtTVIYUGvSzDCF9qVKe4czpCRq5F7M9EJRXZm+VPu++OhwUFRYgjQv26fSKTvk1XJwiPu0iyoOgdY6EzYR0l2kq/aQkZ1K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724411330; c=relaxed/simple;
	bh=eyZIXVjfFHzGxEkRZpTR+bRpgm8HbnbnnCzYM64pN6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nZ9y9JKqIc/plWhE/+Im3akbhn7gumkjkLiZoGe6HUwmrWivR7aUYuGkkSWCx9hWZ0qJRjh1Mo4FauroeuO0unrkNMVyXC0kM6oMJTqTJ4V7Xuiv15n3mLRJaQXXH5iWB2hcianC2v+5vz63ZvHz7fFuQyHeN54pMeiSY6uIvug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e16582cb9f9so1429787276.0;
        Fri, 23 Aug 2024 04:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724411325; x=1725016125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aepb4WoCvw52WAGGG/8W/LM2LQTEihLorm4Ht6FZF9Q=;
        b=OPWtAISJIXP5XWDkDR+tW5E4TCULtQU/Q/4imU1UeaB/SdwQpvH2IaYob0EKGSfeyh
         nblsZ+LnODvbN4XmVTQLyWuaOf1Hmm8nhps5BMkl7sjud7ywu1C9wS3h5zqa1Q4eT69W
         k0lsodY0M+cOQKjAZPke3kDw1QpMupD7x5w0hB+l02Vy2byKcES8nmSle+3wDryGtrZY
         5E5/oNL9YALenLjf6dFSROfS66ehYTogPxsqSRY9ER2CGICmKwjfuNvqjdmR+m6mFZWm
         FDUi5kNLof2lw9KZWw4U+wu9nnnjFb1C95y+RqmRj2walywueHV+iraRdJpF1AJdbfpp
         Vu/w==
X-Forwarded-Encrypted: i=1; AJvYcCVEMyWbfKWmkyAcc2FHYBiYq5o9JYEBYvon5JwJXkKvtWlPrQqjB3q3IPAv2iHhVY/u+olYygvf6pS4@vger.kernel.org, AJvYcCXMurtCblWMQctFdOHPjpX0fxuUfswOGy+uieiJ8NvLZZqoU7owvLQ5d33huNFDCB6zTfzAJ7WODWy9yTlaT1j63zk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiNQmkjD49mMJSEK5KcVqFoJA+KCoCwCQh5k+R3VPB2PiXVf5u
	Os8SZNLK9TG9J6S/tkWXHiZSV05oKpgI+bdBrLitnpulqcDt6IktOxKn/AS+
X-Google-Smtp-Source: AGHT+IGVPxbEGKn6ArKNXsmjhiE1TdQ1nr3Y+coOx69UObqt/Jvg6Hqm5J1Pyhh8WKMAoqMOPeSLeQ==
X-Received: by 2002:a05:6902:10c7:b0:e0e:ce6c:4967 with SMTP id 3f1490d57ef6-e17a76b610bmr1659542276.2.1724411325500;
        Fri, 23 Aug 2024 04:08:45 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e178e4406b0sm612755276.12.2024.08.23.04.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 04:08:45 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6aab656687cso14983937b3.1;
        Fri, 23 Aug 2024 04:08:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX3VQef4wUeuXk+aNQpZC4QeftWFZe6g0ycRYRWO8kZX3zt0ctUX1Mr2V452BFdSTjVQFg2GJnzRLcg@vger.kernel.org, AJvYcCXQc+Q94PZYtH3yvi0+UpJUan//tcWb6ROOwFItXe4/l5fSnEP/9k0NXDNY3EGT3lLPi/+DVsyN5a3otj2phcaywnk=@vger.kernel.org
X-Received: by 2002:a05:690c:908:b0:627:7f2a:3b0d with SMTP id
 00721157ae682-6c304879b22mr57607917b3.14.1724411324980; Fri, 23 Aug 2024
 04:08:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715140705.334183-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240715140705.334183-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Aug 2024 13:08:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVCcegWZp5gr6xZmvaedKCq72am6fAmZ1unctzL71PVYQ@mail.gmail.com>
Message-ID: <CAMuHMdVCcegWZp5gr6xZmvaedKCq72am6fAmZ1unctzL71PVYQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a07g0{43,44,54}: Move
 regulator-vbus device node
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 4:07=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Move regulator-vbus device node from common to the usbphy-ctrl device nod=
e
> of the individual SoC dtsi's as it embeds the vbus regulator.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.12.

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

