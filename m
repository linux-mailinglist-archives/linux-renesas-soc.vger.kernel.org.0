Return-Path: <linux-renesas-soc+bounces-12399-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A59CA1A705
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 16:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF0743AAB55
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 15:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F36DB2135B7;
	Thu, 23 Jan 2025 15:26:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647892135A0;
	Thu, 23 Jan 2025 15:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737646010; cv=none; b=PJkYn4vPjJw6V2kQdPKOcdvpncEmf34lj3W5FwQTwVYsbwVia6aaLpbDK5dPGiPuISfUwumYWVM253PIOnSqZ0Eh0rrObWLqHhDpJmueZjVNK5TUAF8YUV/6l9kwO/iEHhjhOr0SXlLKoSe/jS/TMxmWOANFyx9km4sCwVL3Udc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737646010; c=relaxed/simple;
	bh=oaNoxDMiDntXyi66lcz+FmmY2IP5kt0GC3g2GTmswes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gSQsAqMmZa42qq8ZSIW2OjmizbQYtb/lFKtXmM2K2iqyFGOOs129IMO0lwkiX5RRh2iYQCAdevU6iPlzD6yfYK8Yw+0vs10WiYDv1xqWP8oCUb0y3fpsJgXjQe+K0Xt63bbOhEimMCWtYw+x3YLmlww8Oe6sHL8DoPUqZ43Ty3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-51878d9511bso428925e0c.0;
        Thu, 23 Jan 2025 07:26:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737646008; x=1738250808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ObmF4EAbz69jChCTuuA+EV0Ksc0exXQpmKmEqjaiDU=;
        b=IpJJ5c8pkB/ZJRYiR9XJaU1PImtSVA74EOXEYgDecoFgYQ0xkctqKUjEdOuQkSuK/Q
         VL/oOnbG/U2iWqbfWu3o2pguI5AGToKfafZDUlDTgmS40jFzUm8kzmRM1obvtSyfEHkN
         RVig8eFWPMCif/pRN1SmC9sgaZwccGAL8KzGblTTZ5phP9mMlxlc8dHDlTlpF6Lyg1Oo
         BFemFlCY27CHVztDM4nrizoxiDZDrNVwEPxzANOToh0S3FzGIq0WIISAVXr/ZeW1JY58
         dmLodQIrTsZLx1oHgAWeUfwEMOZvfX35sBsGYqNYSmZssx4qqTPtHlYv/NEw4SpVfTGR
         9vSA==
X-Forwarded-Encrypted: i=1; AJvYcCV4ggLDMkvEDJSA1+GLcGK809ulYG1JQBcSxZh36APBFcS/HSyXUa/juOjbeXAiTG1GUERjktKxA5NL@vger.kernel.org, AJvYcCVYXs+3JTh3FIwC1/rIhBMGQZUKROg1obmb4x1jp1N19Hu+5FmMJxgLO+t5reA5Ib/yBwUhkj8T0pAM8jo5rGzaIHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRgu4oB5bOTE3obLNa2sh2kXUSBUMSGUXEJ5Ap+4L0XHrt+EdE
	/Uiu6yf1cBUhiiGxZh+czlFuVmUXWug9AvHEuQeP8VqdUpCkSfTfDok8Odpn
X-Gm-Gg: ASbGnctd5c0Kugtf7WwIarSB/J4fwy+dNwnGuwADVa4xmo0yUZI329CzMRwQ5Y5HVtp
	lV5kYbuIEal86rVgSo8JUfMBtlyZct+hw4wFtcf1KHsJh0A2dTjR0wTasnw2z8J+8GvegXI8dAn
	d//Aa9O2bINmMHEjuiiWVXQH9xRMK6CfoJSbFGuVu21i113xl+B8aRAtUwT6TZQgSWNF1L9TJF+
	xJydmIlE31NfDCkrqMyg/rhGxI94qF8Y8bMERERmFbJ+TmMxHOuS80b0Ff/ysSf2YzZVFiuSJxc
	lYo/YHmZ6ea9ZZ2qhPzzqvgGpt6pK9XxzKx6ag2U4mE=
X-Google-Smtp-Source: AGHT+IEnzgJmHViyGwxnQgfWekiIVq2R+q15TL5sB+P1AapikW3UIMbbGvxrIhlEMuR71UEszFHllA==
X-Received: by 2002:a05:6122:d22:b0:51c:c23e:8cd3 with SMTP id 71dfb90a1353d-51d5b253f42mr23305548e0c.4.1737646007826;
        Thu, 23 Jan 2025 07:26:47 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8642cc7edd8sm3456437241.26.2025.01.23.07.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 07:26:47 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4afeb79b52fso307522137.0;
        Thu, 23 Jan 2025 07:26:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXmAWvbGAluwCut8qimBg+mUsmHOpLLqM0eFriOYT+BIooxyyoihDS+trfmdHu7nlIurSY9XrQShZS4@vger.kernel.org, AJvYcCXmp62p7tWE6pEvATrXnvMQ/CQY0K9D+NamtpdMZj5iC6exbE65C/rj7CEc504qGvQs0YFakotdtzdo2exb8P8y9Ac=@vger.kernel.org
X-Received: by 2002:a05:6102:4b15:b0:4b0:ccec:c9de with SMTP id
 ada2fe7eead31-4b690d322famr23895215137.24.1737646007443; Thu, 23 Jan 2025
 07:26:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org> <20250118111344.361617-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250118111344.361617-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jan 2025 16:26:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXe6ZOKXPRrG4pJTsP_6ZaAysHrsNGEC76ASPOfP0aaXw@mail.gmail.com>
X-Gm-Features: AWEUYZmSg5HWSdLGc8j6CDEBswP0pzOY_OzDTJ5vSW2vEF9CejAiXtH9hbGKZEw
Message-ID: <CAMuHMdXe6ZOKXPRrG4pJTsP_6ZaAysHrsNGEC76ASPOfP0aaXw@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: renesas: spider-ethernet: Access rswitch
 ports via phandles
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 18, 2025 at 12:14=E2=80=AFPM Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The r8a779f0.dtsi now contains labels for each rswitch port in
> the form 'rswitchportN'. Use those to access rswitch ports and
> slightly reduce the depth of this board DT. No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

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

