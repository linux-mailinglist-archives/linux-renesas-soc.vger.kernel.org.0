Return-Path: <linux-renesas-soc+bounces-11267-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CF89EECC8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 16:38:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8513E18878A6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 15:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D8F2210DE;
	Thu, 12 Dec 2024 15:35:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FA2217F28;
	Thu, 12 Dec 2024 15:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734017744; cv=none; b=gbWgh7903fREyKYXgji1nrbA7CGJowMHGK05ibT6cSSUnLfXsN6eghJaaVbObOe9ueRDdOICfdHYdnu6v+ZBqwC1dR+GQ95+NTPwV95QWEOPIJngwOau81eopX8/seEp0RQP6bi+fSOvtiMk/xRBSz+wPQmx6MlPVHJHGv5JFY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734017744; c=relaxed/simple;
	bh=XprCouNss7UrGJHoxkmdMkC1Va7aj42s7P74LKxiePY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ABt01HZn0KpU7sYXF8GDieNisxrpNjRwt/mZlnHiCEk6VjxFP9GPz8v+tYPnomSTDQcW3a2idxnbFGUDbbk0gDz0yLU6g5Czay59LMuQvQgnVldJQFeJ6N5VCQRsY3s1yDHO4W74KLC1ow0NgvCfCY07hJZswfFreAET7LPC+kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b6ed0de64aso66805885a.0;
        Thu, 12 Dec 2024 07:35:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734017740; x=1734622540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fd85a5nQ1cXQ0yotDkDBSuWgaKgnEtJmGTcqgh8+dc=;
        b=dcGYGL8b1rG5PFw3vwkQtN5qHwpgL7xIOZF6awRiko8qSf3RNM2H9cDoNH16dXE60X
         b2BtMZOP9rzgTDZD4OJZcwxxvJgqPsLZbMM36MKH9U0RknPSO/dhrBxJ8E+E2Sq+DY6c
         qIV+668VpYwYl6Uz8JZ7kX+IFkP/FGhyUmTOYCy4znPHvFZ1E7pCK+WDzW1lz97cIYZt
         G+mHPdL+PaROJhQd3cgmtfEfSabYNtEszc6egqWnsofPVeAxp+EcJmcQYshhRPIVbObw
         ZhvWTRtSrByNGjevDAl13uL9HJNBLSZe3soaqOKnX4JiF4BPXKveW3qCWNpfr/Vex3hT
         4oww==
X-Forwarded-Encrypted: i=1; AJvYcCUwTGzuGEg2rfjwh/XEBIqotHSjFzcL0dScUQx/Y6lZYEcYFc1Inci0Mnt+Krc/TBqIqgygvuGHIH/ROsP4pgEOHbM=@vger.kernel.org, AJvYcCX+9l8kadpI4ZyAtGrQlP3DSuEbpHCPVyixksZKCRp8WUxGfDKIUhN+uiMx+79e3Rh1x0L93siycnpl@vger.kernel.org
X-Gm-Message-State: AOJu0YxtBqtsFP0CKji7uc5w0rw1aPkHJB5mYQm0mwlQRIzeWAYKiVCw
	gyQga7Q94eVPtZqQP7vnpgOIKhgKS/ExKIp3hDT8vJ/8sa+rTefIXE6IL78cpYM=
X-Gm-Gg: ASbGncvpGqMdBVAqPAs3VKIr9bIElsSCndxrLJ+w6TCR8UB2SpjcYL3ReK9u5upkTEo
	CYxQnwHUhAbIde5PBW9BN89d5XFtvouoZL/ceeocdBRzGiAQ7ktvjOKJ1hop4nJE1hmQr7sdklw
	z5DFYW5dYIww3iZ2c0QxMKKmJZqBC+uhsEVYtf2BFAIipjvl0jWYa3K9Cs0AyEw1Vp6BuJMnCuj
	zE6X0fVKjy+YIlPR4WfbUMXNAvHkQHRGHL3pX5t+Ycgg/UFO+/oxotlWpQ17dRCW6cPuUSy9RV+
	aqtJXTCc9PN9oS4OVDKfA1A=
X-Google-Smtp-Source: AGHT+IE7UmlvOBLDRtdGQrtjw9ut62LJ+TaEuphmpeEHe2DFeyBuukZ+/T7rHXflpllG4mxymfP3MQ==
X-Received: by 2002:a05:620a:8081:b0:7a9:abdf:f517 with SMTP id af79cd13be357-7b6f8dbc7e5mr118165085a.25.1734017738959;
        Thu, 12 Dec 2024 07:35:38 -0800 (PST)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6cfba1728sm470801885a.46.2024.12.12.07.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:35:38 -0800 (PST)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b6f7d7e128so37673285a.1;
        Thu, 12 Dec 2024 07:35:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW5XzdPJB8UwvMwUTBlFwAc6Izuk2muMwtjQzNeGvng3WMZAoCIJJhnaz0Z+MfECUv0A9X6wgCcgfZ7@vger.kernel.org, AJvYcCWdSJoJOaHGKW5C4dq8Y4e/yYIDK1SGpOV8owZPi/vYsz8s8eLxSdIU83cBx0gPK2OUiEC3zm7ac1fEV1i8iiABXbg=@vger.kernel.org
X-Received: by 2002:a05:620a:4802:b0:7b6:d7be:2e4 with SMTP id
 af79cd13be357-7b6f8dbcb39mr102362385a.26.1734017738207; Thu, 12 Dec 2024
 07:35:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com> <20241203105005.103927-10-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241203105005.103927-10-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Dec 2024 16:35:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWUS2Jbw1BFStFfvGfpLpCR2vWFkdmcGLJnD=3sxptT+A@mail.gmail.com>
Message-ID: <CAMuHMdWUS2Jbw1BFStFfvGfpLpCR2vWFkdmcGLJnD=3sxptT+A@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] arm64: dts: renesas: Add initial DTSI for RZ/G3E SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 11:50=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add the initial DTSI for the RZ/G3E SoC.
> The files in this commit have the following meaning:
>   - r9a09g047.dtsi:    RZ/G3E family SoC common parts
>   - r9a09g047e57.dtsi: RZ/G3E R0A09G047E{4,5}{7,8} SoC specific parts
>   - r9a09g047e37.dtsi: RZ/G3E R0A09G047E{2,3}{7,8} SoC specific parts
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.14.

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

