Return-Path: <linux-renesas-soc+bounces-12078-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE64A0B35E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jan 2025 10:44:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33ED51887AE8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jan 2025 09:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 720681FDA8B;
	Mon, 13 Jan 2025 09:42:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620BD235C0C;
	Mon, 13 Jan 2025 09:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736761325; cv=none; b=rq/tn26Hwj9Y2nS+R2mkdiVOBrQIInlJFIhjhOalNZvBN0rJDvd48jEQoK2Z7alUCBdMtP9Q4Pp5wMEvIp3LGLH+Sg4aYVV6blsEuOOazJGLQkzSYKo+wtiBDvmuXDXiiY6Ibh/ulPmV0I+mB8/cTHoRhITpw5W6PAwNCgmrb/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736761325; c=relaxed/simple;
	bh=tEAEhITnEkgQ+vuaOKMiYtiFy4veOYklRUGRcAkf9j8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G4AtS/mRdbw9AsWZur6vBunEH1kOIUOXKI/RFW76HtL9dkm1pIHOfWytk5BLW7rjqEguhSCg9NjvsiUogQU5PAiMfxxc2qYSnHa7q6q5PwkdcvopLjNaDwHUQFV8LYCqN5rTx4BLHL5eKREL/PriTbETK/9pzvHS71SBRi7J9sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d3e9a88793so6878925a12.1;
        Mon, 13 Jan 2025 01:42:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736761320; x=1737366120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nk3EkV0Yif/1K3QpdnWUDxP88GHxUnUAsBLg0hGBmrc=;
        b=DH8uhCEr1UEOAvDR8+k2oLOJ8AXD5PvdYvVoYBjZ6rb70QKhlj7ph1OB/nZmC/PaFV
         HSAI+fqW/romVsrtChE6P+VxoLFEQLYLcqS41d3MtU4KDICSrYxNhtRpEmQwbhK7xalJ
         ZXaQfwCYQ39vjS/REBlsLHh4Ep6nd0reJLzHMOsIGnMXx/kPPDqufQ05OFpRNht2/2DX
         DcPhknNiDlWPgMFXKwFmYweNGEBOhpvFHfVYAGgiVU24AEwbl3T16AEXfMUwxi4bfYJD
         72wcUflOaEm6mC9gVt2xDy6evbZlkjZJjXSxoh4vbfAOBdzeiV/ykTgaM1i4b21+5Fv8
         802w==
X-Forwarded-Encrypted: i=1; AJvYcCW4VRL4flpvLHj2I1Yk9uK1ITlMQpQmrZ7f8hekus2BSsIneu22HRch32h0SIOqvmfBEAlhCej/mOfKvubq@vger.kernel.org, AJvYcCXPMo73iQ51wdh/aNSepZczPKyaGzXgnog2sc0k8VXWAOBhbBYWHvVTqcRpQ48r0/pBzU03+Zih6NdoCBTG3uyTKJY=@vger.kernel.org, AJvYcCXYEkRAoQBbkaJmuHh8mddqPuRQw7UzDNeuqmxwH6QW+8mZ/0CnZSC/E+S0546W6RuxqTI6W2T4AKDx@vger.kernel.org
X-Gm-Message-State: AOJu0YyTe/0Vu9CTAw1UHDlUlfOXmrVW1bmN/DJ7ziKLXUNWiSqeWo7j
	OyWmPMqwUw+SWrV6jLbhsbMNu+kCFCV14AYQeL+Yyxero1JhVtbZtWx2uFNgY5A=
X-Gm-Gg: ASbGnctXLLloe+ZWjpWYld7BYVeiJxswY6gBCXTBEdjrTicqaPJNAv3DoINjhUzgK+C
	9A0mTMkJWWEC2v0pW8nP2TW0laSSJfsSFlouJ+f1L7UZI34HChvW5OqmjrNnbS6dvk7oVSYy/m/
	dttIepr1ObveDIN5leTE8Y9IRp4LRFcf9Uxtuo+2d2puf/PQga+cuTd5sSVNPnmWyRY+x8+wa9u
	fGWv3ye8RGVOx5ph954M3zC64YziQU8tOKwM5IHR1CmAP8xVRbtah8SWCeyvBNESeMQxjTQbJPt
	q0NZHIEGMYDpLRfPUOM=
X-Google-Smtp-Source: AGHT+IFFCkjiXtxu/U6v67jWx5/JIt+U4vqzcn3yqZNyDuzKfppTB7AjnVKgWjWWZNYyWwh14m5MZw==
X-Received: by 2002:a05:6402:13c1:b0:5d0:ea2a:726c with SMTP id 4fb4d7f45d1cf-5d972e069b5mr17366805a12.8.1736761320087;
        Mon, 13 Jan 2025 01:42:00 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9900c45aasm4594223a12.28.2025.01.13.01.41.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 01:41:57 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3cf094768so7169739a12.0;
        Mon, 13 Jan 2025 01:41:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU3OetmWWwCPDdl33OFYZz4mp2H7dUTAgnzkgzu8/ksI2/M37fGJNSdqbrER5tDf3snZjG6+FuY/BZne9qs@vger.kernel.org, AJvYcCV2JHpJAj9Mz+egV5uh1mC3VSG4QEHCn/dfulicxaeiH2WAdyio0DqBxDbSMuWXZxkYZ4trJvTpF6EL@vger.kernel.org, AJvYcCX/25tUzLRTKOIavixvfd5SzuC9iJMX6dvlkFcB9qvuQG2/LISHbE6z69Lco6tDIcbejLiWi5dupBwYD/Px6LemCwY=@vger.kernel.org
X-Received: by 2002:a05:6402:27cd:b0:5d3:cd5b:64da with SMTP id
 4fb4d7f45d1cf-5d972e4cc99mr16591487a12.23.1736761317433; Mon, 13 Jan 2025
 01:41:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111080903.3566296-1-iwamatsu@nigauri.org>
In-Reply-To: <20250111080903.3566296-1-iwamatsu@nigauri.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jan 2025 10:41:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXdvAYLi-3Eyt=5LTuDG+7rh5fo7VT9kbG1TD5dLLsvbw@mail.gmail.com>
X-Gm-Features: AbW1kvYF1XD1pP1ZWfcXFXxenTotNO_Q21MKxoDph118L2P91yuMGm3e1O_vhd4
Message-ID: <CAMuHMdXdvAYLi-3Eyt=5LTuDG+7rh5fo7VT9kbG1TD5dLLsvbw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add support Yuridenki-Shokai Kakip board
To: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Masato Kiuchi <kiuchi_masato@yuridenki.co.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Iwamatsu-san,

On Sat, Jan 11, 2025 at 9:09=E2=80=AFAM Nobuhiro Iwamatsu <iwamatsu@nigauri=
.org> wrote:
> This patch series add basic support for Yuridenki-Shokai[0] Kakip board[1=
] based
> on R9A09G057H48.

Thanks for your series!

> [1]: https://www.kakip.ai/

Are the full schematics available, too?  The "Simple H/W Ref." document
contains only a block diagram and connector pinout.  Access to the
schematics would make it easier to review DTS patches.

Thanks!

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

