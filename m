Return-Path: <linux-renesas-soc+bounces-15928-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB35A88740
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 17:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC95A18888FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 15:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A8623D2BB;
	Mon, 14 Apr 2025 15:18:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CE63B1AB;
	Mon, 14 Apr 2025 15:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744643930; cv=none; b=slT9uj+YFtwEwvGXppQsX4+4uGwy6e40wg+A+i2ciK7H0iAwfoHqWVgVIWmJRRdfTeffnTa+i477X/qUmvxBMAgVO1ZI1PoJ31X0ZVdV2zjoyxGVq92pwwm2iLgGTMLvenwIVhffjZs0Yw/LvVsklb5j+5PetkC4GAJ9KqwNQLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744643930; c=relaxed/simple;
	bh=VCIZdAYdazagZd62iP/i4ZidMAbphbU584rH67Nx8uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EUuD6pRe5AJeGNFIJD60y57KkmwsvYXyxakIqnX8AVvsOUlsBTkRSzaINHVebg3vVw9iDhTQaIQkJCvwRlJLp09TnsmEiv3AXyrbrxxanKiYjCbhNIHudeDUrJMouDS2aTmMCUknEDgqT57Z1sD59q6SqDCvDI85fBOh60uIeHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6f0c30a1cb6so25226446d6.2;
        Mon, 14 Apr 2025 08:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744643927; x=1745248727;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lpszFmLJH64FRQyDO8XkcmxaG4duvvzDvH9OP3Yd1SI=;
        b=iIO8zHMcfdTc53/fIabuLyDI3r6NDDCM4PIXBNqF6c227UWlleuXtw1w2/qjQJcPz8
         62jrNFQ5HyIlv+G/QtowLPDwbbyEO6SoFkLaTlt9wQbs0v16PmEWbyfKvSy+xThMDiud
         yWIZie+D2ND1YC2WaCHq1Wi74FxOm5A8Cjr9+0xyBhuQrww2zWreODqifdgEfmcww8U2
         tRfIpTZ9f1V7nYqhtVx+MTE4JRYiPpJMtBCvTJbT6WNmIDfp9a/8IN0h+dvmFfW0oqyT
         YKZsidNS1WPzq77ce4TytiGtiwSZBmSDa0FdaINYv9yL6m4SF49aX8SSKnTZ+5e3PVZH
         MjJw==
X-Forwarded-Encrypted: i=1; AJvYcCVSLIxLb6bhmaVXdqk3r0NCiyYrzixSbjiwtx5HiPgDkSv1O2FGBkICAz0gQJ22hRfsZsYfoC7G9f8c@vger.kernel.org, AJvYcCW1crRF1xxAgTe6ERCqoOtIpwXdeUJ9G7p8jE0l7pasPDg8Qk4ahAMhIIuFIyS7AXPPSkOfxh0lmgnWm0tRTpPPj4s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDPdA65wsNrQ6Sjd/I3gSvIQpsA6TIJTglqtO2LAXvgVIp2Dan
	lOvzT00twua9VjrE+oqlTBeDyXo3P62bxCz3R8L7fhjDban+CkdqTA9L8sSD
X-Gm-Gg: ASbGncvdKxInLQds9dHmtZw0M0aQAFG3edNNF3XpYTQFSluoYxYF4yBIQgvouKY2S/k
	1gVyAbY581JqNrw6o6B0/R4si7SJ6M7F0y66zwiwTwEbPnSdf0d4DRNkRq9xxkuj4m99056fqsC
	ct9iAEoaPEKGRFwRudNWDQ2Qr/iJZtG2Qgz44SfdEEvMsaoAjXJmw0snVIWbRTWagMsGFM2Oa0x
	dqT4dUc7qTXwnIUzpv9sCRTmNmEH2CZsWX6hecP9x6wuAqQwcH0cCwr9ivqsE5yJevR91S8ykYk
	bJndMMIV3hjWvpzFHr0OUKrz+ADyco4qtko3QyvfQDNEm+IqMqc/xRMddiy9fj3x36ayHU6sibu
	s7pc6AMY=
X-Google-Smtp-Source: AGHT+IFQ7BwOX1yRnUSVDbuLsGlcMnATaBU3bRWXU183UfNbCX3MEbm+JKguPR3x6PAmvPISPPHHjA==
X-Received: by 2002:ad4:5f4a:0:b0:6e8:ec85:8325 with SMTP id 6a1803df08f44-6f23f152d4amr151916226d6.39.1744643927301;
        Mon, 14 Apr 2025 08:18:47 -0700 (PDT)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0de95f701sm85708506d6.9.2025.04.14.08.18.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 08:18:47 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c5e39d1db2so251390885a.3;
        Mon, 14 Apr 2025 08:18:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWBkNc7EfqcRAw/n1bkiZtTvz75o5svUicf2JlHcdbHigip9sb1ed2YJYmmXo5ZFsHkovscNuLgZAeDvC4E3k+dGQo=@vger.kernel.org, AJvYcCXTYEFNvtJo2QMzE2Q8AKxD8fVefm/uN0VR3ktWmBVwWp1nw1v5lH/Oy8fAH613Al128CbNit5I+O0b@vger.kernel.org
X-Received: by 2002:a05:620a:468a:b0:7c5:4738:8a11 with SMTP id
 af79cd13be357-7c7af0dcf0dmr1962879085a.27.1744643926839; Mon, 14 Apr 2025
 08:18:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320164121.193857-1-biju.das.jz@bp.renesas.com> <20250320164121.193857-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250320164121.193857-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Apr 2025 17:18:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUVmOuHnTO_qOqgQxZhV+++XuT0NfudJwkn=QqX6humpQ@mail.gmail.com>
X-Gm-Features: ATxdqUH0epYgFYqrOnsLf_V9L5AjLGdQ0wu_apeih3k6TVsut8LwrdiVcoE6Row
Message-ID: <CAMuHMdUVmOuHnTO_qOqgQxZhV+++XuT0NfudJwkn=QqX6humpQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: renesas: r9a09g047: Add CANFD node
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Mar 2025 at 17:41, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add CANFD node to RZ/G3E ("R9A09G047") SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Replaced integer with hexadecimal for module clock and reset numbers.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Queueing in renesas-devel is postponed until acceptance of the bindings.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

