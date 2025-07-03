Return-Path: <linux-renesas-soc+bounces-19067-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C754CAF6CF8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 10:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E668552372F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 08:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A6B2D12FD;
	Thu,  3 Jul 2025 08:31:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AA52DE6E8;
	Thu,  3 Jul 2025 08:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751531517; cv=none; b=ZEBmyS3+ZA5ePYSC53gR5InipBFn71AjKlJ8KMX03hrVajte5QgF0DxM4t9lEWc0jlszvQSOEhpmBOKwJmuZK0DXCPSohxhtZBdm71ac/Pcm+fBfdbPtCDlveE3TUcpA8uj57YCW8GslgcNcvE7kzxfvMIu/zetDRW5wW83M/xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751531517; c=relaxed/simple;
	bh=1kEHEAtL+xQOR1Xta9OGgGAHb/6BYqBlR21jUZejIn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q7Q3Z6Z6gfwydLnHp3NNisFwSBlKw8ykEGU5IMzvsJKlBGemTSV/sYD0bsmLXZWPwszwc08w9dRpjrD7jzcfF2TUpkTCztKzpgCuWoe4lNUE/2QTvs2IQrIES5X30PdjpM9k29mqaGXn17mzIe6pOcbQrf2mHsQNDMJjbX+UcLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-886c8de5d90so442427241.0;
        Thu, 03 Jul 2025 01:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751531514; x=1752136314;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Rrnl8A78Ot72qT4JJsETkK35WvjMF8fm1TQ3376urc=;
        b=RqmSBvno4+HYbMhCzEBnhUsZLEAJPZLSpjQJGZXaG0tS7nK57kjxIX/WTueJEq9l1/
         XONOSsucQFzwcf6FgvDgcPNk+hwBgs/VqjeDCVJJVRtPPbDP/WfWCyJTQsFvEseb26eT
         7RT4PuC/7PQBSBMHmAUiUF6nlBg8KXXSRvgI1AxjCQ9txaB9tQ/ytp9uZuZoxcgHsCN/
         ysQgOrLL46c9bAOOugPhZs8Czv1BTv8Rqh3QyijE8LC90koQRA3W3vGl0iMCMippWK0L
         ug04nzgETNM8b+foFaTNU8wwClTDyuFkqslV5qRNpf0xKljQa5mro6KxOau0TgEHDFOv
         xAug==
X-Forwarded-Encrypted: i=1; AJvYcCUBunbbhD+8JE3Jxq7wEYJ9FMrfIDdz6a5E2gv5CJB4bID6KlVUQb+6sbb7E3DUeAfzanmekNVc3HYy@vger.kernel.org, AJvYcCVF4Xh7NGqBisG10hECTZyg5L3KqBIkgaVH+OmcJ+FkwxhNd7pZ0G/j2MMYdO7E59tVKsc/I1W2dwR1DihVneKLbHM=@vger.kernel.org, AJvYcCW82QgG5Kt8bRCS00u2OxPSQn9bVHV23/ZnWZKQMeebGwzcioaizTbm+xajTUqkJNJX3eQcISAkIvgiKkXG@vger.kernel.org
X-Gm-Message-State: AOJu0YwUAy4tn9VOI2w1CSrkAVNtdkbX6iW4SXxlC4yni2T/gTEhqyW1
	wyfus6gHkq8ADzCj8ddHy7dhWH8eSZ5JtTHQEcyPicIdDJyWUIC5km3TsE0jaeUC
X-Gm-Gg: ASbGnct2UNfwPgg5y+fTL60IGuscJDpzaDuhCTEusb/JKkQtZJvpHtTH29hClgZFQeX
	xJxUlpxv443NckmGwjHp4/qRjUwp0ND7CIFhGYV8CAz5iGLvD6Fj5A2wPauvSBEl0XVnqopNElw
	ZT0nbYITz+v7sogEra91EixBpadncI22SB2tumoabkif+0oNVTq/7PnIa6fF/kkKwJZ4A0fg9la
	W7o2b53qQ9HcwlE+DnNG6+mAvylRl0xF6Yv5iJ/ZJE407wJVNnxUfC+hY4AhDcLuiTtp7t+H+qS
	jMWTRqwpdxgDXTJJP8O2SyR8XtipoHW11+/fiWa89Y4KRfyHvNPrgjidpsLDmZ90KggadrfiGmi
	Dj/VOyOYBPE8I/ddOgBAjmum4U7A8ZkKVi+c=
X-Google-Smtp-Source: AGHT+IHFmlAjymRsAjcOZcUEFPJsX3qwNDNEAcSU1+k+hq/73qQL/T3wQ/9d+m5dhA728+/blinBCA==
X-Received: by 2002:a05:6102:689a:b0:4e5:a0a9:3ad1 with SMTP id ada2fe7eead31-4f17479c21emr2033747137.2.1751531513896;
        Thu, 03 Jul 2025 01:31:53 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-884ee766fe7sm1900418241.29.2025.07.03.01.31.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 01:31:53 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-87f2a0825e1so457174241.2;
        Thu, 03 Jul 2025 01:31:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVmjEj9k88bx8Py9uQ5/XF12E5wLP0qtXp25GXzzoBar+eerZ85yX7xYsN7OJbk3tB48BSUcRqMJzBGODSi@vger.kernel.org, AJvYcCWjj7/PA3CsNIH6YHIwxog0StIzH/p/Pa7pnmlpjuG/X8Y79xWQLY3907UAJMsh7InJpyyMnSB4fjMSX133MazybiI=@vger.kernel.org, AJvYcCXcNtgjyiYGtLpAopMEGxXH43QMmAZ3ZLogpu2fgbOVzyxMyRTIerd3ixA5trxSGh6oRMD5qRS98Jr5@vger.kernel.org
X-Received: by 2002:a05:6102:6481:10b0:4e9:a01a:ed57 with SMTP id
 ada2fe7eead31-4f174a08262mr1350401137.20.1751531512921; Thu, 03 Jul 2025
 01:31:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87frfddghg.wl-kuninori.morimoto.gx@renesas.com> <87cyahdgfu.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87cyahdgfu.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Jul 2025 10:31:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW7bo1-7ChQ1uXJYWSZ2anyM3NU3-jj8evbw+NVRW_1BA@mail.gmail.com>
X-Gm-Features: Ac12FXzmqA1snx2jD8jqedEwfPi52TfMhZyXCh7LxjUXWZIBTmcnchov9sv5N8I
Message-ID: <CAMuHMdW7bo1-7ChQ1uXJYWSZ2anyM3NU3-jj8evbw+NVRW_1BA@mail.gmail.com>
Subject: Re: [PATCH 2/2] serial: sh-sci: Add R-Car Gen5 support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	Nghia Nguyen <nghia.nguyen.jg@renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Jul 2025 at 06:52, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Add "rcar-gen5-scif" compatible string for R-Car Gen5 support.
>
> Signed-off-by: Nghia Nguyen <nghia.nguyen.jg@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

