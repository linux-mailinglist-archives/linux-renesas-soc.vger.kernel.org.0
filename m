Return-Path: <linux-renesas-soc+bounces-11719-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1B89FD52F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Dec 2024 15:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EBC1160BA1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Dec 2024 14:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B451F5400;
	Fri, 27 Dec 2024 14:26:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5160118952C;
	Fri, 27 Dec 2024 14:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735309570; cv=none; b=uxArhBnM6Fi8Al1G1ncjpKqEXJeBV2gXOpvmOeCLuvzEnpZmWGf8xEmXOh1HaH/vBTNzM0QhOW0QPZ0bB0zIY1qcFKfwlaizLVUYs6/fzLHDH7x2G2iV4N/LyGdQKn17rZTaa7ES0GZMqorPEbZy1zNJX8Hhk29TmWCjuvkFR+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735309570; c=relaxed/simple;
	bh=dEjyca8HKnckFt/otpzUvrXdcdG+dPmw92XCw9OshfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kln45lelivoBjPrNomDD05UK9Ui7OEDOnr/Ppkk5GLd0Lxpr/jhy4HKalw10ldxvVdkozltk/TtSmSu4e5HukUYun9r6FW8QpYc/xcvw3X1U/xnl8hKMSI6R7m4pEwFhGe9mbtHCJ6wtsrbNbH92/QfFUz0AAR4m/o+zwXXyAMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4afd68271b6so1656191137.0;
        Fri, 27 Dec 2024 06:26:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735309567; x=1735914367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EgPSbsr4XqFp2xnDtUEgiZSvNky3dHNY82rBwYlGLSs=;
        b=qFtsURtASyRC8fCNr2B4Waji0oSoxd2Grr+TAMc5mC9BLU09Jh1W+mGhJxsUQPjDCn
         Ip5s/1SNJXLGlVzGaGHFOqzsBzTAUl7BNilOMMKxvg7aCKm8xEIZ9ocQF1SzYhKKz+dV
         0FsGin2WlGkRe5kYgspd9eFNfO6gGk9SkicRZvUUL8UNzTRaL0q1TqqlTYaBNVTB0Kpj
         ez3WOKGPY3cBIOJmVeAiHwEF2VglvMD4runvD6hjuI/SQIFmq5LG/poYs1VqeCWB7pWn
         bpJtTRJbVFHKejtZOqItzMQOVe0LFJsjNIzw+b5zlv2t5UTFto9PCkf55+gRRlyoNf9C
         YDCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA1w1nGnAkg5Z0RP4mKKH0crUqBZ4JBNwIemWIAvriwa/tPkzsdjxjVIfOqNzGyDDzLAphwnhIxWg=@vger.kernel.org, AJvYcCUTCEK4TvhiplgRrNLDxeJEWqyWi2K3/HSosdP41j4EojIA45Neg0F0CdVB+fjVmCI+E7JcuHAcU1wiVz/i@vger.kernel.org, AJvYcCV2c6UYbQBk25BrlyKCb9OyV6apDtiK2kFlZAAtag9sWdYBWMyFwvIqJdzRhp9eL/RPk4Q/n1Cqh8BTRkCSGcfSuLY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3ydTCZ+5L3uNpXNw7eN+JN2Jiy+cnsHDBuFykdLMWca7KE2o7
	G62Zdw1X9rcEGK/shVkmrNVTSED1M4YtMdB0FJWNW7wC+b+jD2NKchRoe2qR
X-Gm-Gg: ASbGncsegS+TEW6fDPB1gTngznLII9fNxAKnL1QCleSFnWbZ2XCVsX7g7in3ThBb9kb
	nSWFaTYXVg+qgZrsDXeog/5Os86Gt8H5ZXNlvHJWXbLS3U/sr48/gz04n8eWIMOG/NCDhdqdxiY
	5WviblpwejVNfIchZkAo0rC3YffsSHCvLhR/tLea+vHi8m8Q7ywtKjYnxySyv+fBglrQCwTO4cL
	Eyk3gobaJYz6v+Jqy3Py70+0oahRUYw0IzQtuMp/G9gyEpPgWUt/uWhZDWQZ/8mXK6SabyBZF3L
	v5CWtYUqvYXl785gQTA=
X-Google-Smtp-Source: AGHT+IFh84M91QZ9Hr4sk305e1kYW8ICZtzUS+JaneYP43erfk4mmC4YCHBUFspn/Z/2TnqTG5dFFA==
X-Received: by 2002:a05:6102:4422:b0:4b2:ad82:1318 with SMTP id ada2fe7eead31-4b2cc48d1bcmr24166139137.26.1735309567065;
        Fri, 27 Dec 2024 06:26:07 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bfa8d590sm2969473137.26.2024.12.27.06.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Dec 2024 06:26:06 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4afdfd3124dso1933308137.2;
        Fri, 27 Dec 2024 06:26:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUGoHN/RqlXPOoFFvVEg2TcM3K7TCaU8uCyacR+/oSBHU0O4IJeYeaFHcLzGFqDZE9nQz6ZGBrq8vcqKXgY@vger.kernel.org, AJvYcCUJWekYsmlZoRhRokV03XUnA+IYLHFjQ/2/LIGSB7vXVlVwDIovaw5IwpKE0k+wS/7rcD3IhbUq+xc=@vger.kernel.org, AJvYcCV/D/eoSlWUXVLhh5f1gP6/1DL6OnGwUCzd4B9Lw6QZL3CWoHUcf2/N3C9iyMEto065SYCexq1nbARx1RFniH7dfqM=@vger.kernel.org
X-Received: by 2002:a05:6102:54a2:b0:4b2:adca:c13a with SMTP id
 ada2fe7eead31-4b2cc385b41mr24968654137.12.1735309566501; Fri, 27 Dec 2024
 06:26:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241223173708.384108-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241223173708.384108-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241223173708.384108-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Dec 2024 15:25:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXC519CdzZXUbcT-wUK+v5-7mSkKRDoua7DLmX0sV9OSQ@mail.gmail.com>
Message-ID: <CAMuHMdXC519CdzZXUbcT-wUK+v5-7mSkKRDoua7DLmX0sV9OSQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] clk: renesas: rzv2h: Relocate MSTOP-related macros
 to the family driver
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 23, 2024 at 6:37=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The `CPG_BUS_1_MSTOP` and `CPG_BUS_MSTOP` macros are exclusively used by
> the RZ/V2H(P) CPG family driver and are not required in the SoC-specific
> clock driver.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

