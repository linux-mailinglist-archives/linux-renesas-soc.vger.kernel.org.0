Return-Path: <linux-renesas-soc+bounces-16649-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4C4AA75B4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 17:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13F143A4B02
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 15:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5775256C60;
	Fri,  2 May 2025 15:11:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C46F43169;
	Fri,  2 May 2025 15:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746198671; cv=none; b=ZVhI8XZ/qckcW3CTFw9viugvNp9A1tP3+oSGcM+DIDZ9+4lWc9T5fQVYj4pcHTiCsQX2xC0s169FB7K6UhFu9etOtAusJptQeJuJF8aCPePeq1D1skmZDV29rfQQwVAsHz4iQYjRahczCbT99KwEtJ1F6+UvKhQ2jc3S1ZBTJ5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746198671; c=relaxed/simple;
	bh=40JeNHNEb+0/1kOGsGh6QbFV63AUgF+Ha24E0dW5Bxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nhr930QGGNfvOB+KpuywV7L6CW3rT6CMjFw7pLnmyl6ly1P/PNTdqKpQYiEV/ieVGZ1iFD7DvWf+GAfaureLOwZiq2V7jYRqn6xAXOoiWCX2sawfmc/p7dO5/E7LC0qM1az4BFmqZLKOsBnrDRh2u0Z1UqQpDHg4Fa1i61vXufs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e900a7ce55so38596386d6.3;
        Fri, 02 May 2025 08:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746198668; x=1746803468;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mBMlYgAr4idopqw8FHOyo6jY6lAwdQtSa8L+QC88eKo=;
        b=bOBn7KTErtVECRjyTvQWEAXejhTLImGhffoVwYs8wKyTTJoMKRed+0Ffo4hPVLhxGk
         I/boHhbg7wmcnN81RO0pFUXM7CUCiBZY4g6KDry0TILYbybsdXRT6/rqRPK9TVX88Nte
         O2e1vdm11QwrmQmFr5nJmVoAhJJbfokrD5Q7hHFIfpmGfH9YbBpTKVZzhRR1WdEAjNey
         JdpKDcKuheZcnRPDmFaL6Ke5Px1ewSCQB9snve9efb2hZYgX0/nH52ckHvPb4IKwYMIo
         6/iwLeasCsVgIZo6B9EwnyJQL61ocBB7iaqjoe9i7pSC9QoXt+ywGsAN9fHPw0tiTAfs
         vJjw==
X-Forwarded-Encrypted: i=1; AJvYcCUs4QNdH2HFWT+IJx6sZuw6KrUmUVZNfo/zJkVooe3epq8J98ymba+H8PjU3mBAJ1XH6M2dCreVR7+0E97OEjKB+wo=@vger.kernel.org, AJvYcCVAcx9zytGNYVXlC/KmprLdhhhsdxwoNtEGnGcJpEsFuAx1Kq3D3uqL3D1zzkhG4MOKuWEuhfnDYmb3@vger.kernel.org
X-Gm-Message-State: AOJu0YwyOCyB/M5TfBXfjx2egtJ711fluG47ywr9P1KanT3vqTrVcG6t
	abl8RPWxuHzcO+HttqBUR6O8Xchcn5RAs0NTFA7uX0WOOgJdCe3gBg9bxmOn
X-Gm-Gg: ASbGncvM+h8PR5/HtYbWCd+/8WTchjsfVYjnKg2cz+jG+UNIAlf56Wfr2MDtF+9bUA5
	0KbvaoBAnicnsvDBMBRu6hbwHWyr+fNJzVj176vu3FIovZN1saLKG2rAhhyC7kEj2o88hhkQtua
	9QCA/CXngbleFWL+/U6CIC83vMjrZ+ukNQ1Q15+5DQYERIdPZF1aSCBXbj4SxntWpAlwlv0/fYh
	BC1hZ+7bUeHzMnQFeU1I2yYpZwSb5TZJ3YR/az4Ttpb6rCatALkS/+VvGlCCphtoS0Ixn5WAZ/D
	ICjgUptNFtEGGTQMoBnBgJmQ7Qh4uwo1BGKGCyVJS/++dDhsrB9FncGQAdrlKNOTmWsLmigQy5N
	qOdk=
X-Google-Smtp-Source: AGHT+IFEMw41PDQ5OgWJqi+mFVbuqYhrWSw+Ume15XNPs6n46FIi2TXZ8g7sHaAB5RCC2Oxf3aoRSQ==
X-Received: by 2002:a05:6214:1d07:b0:6f2:c81f:9ef0 with SMTP id 6a1803df08f44-6f5155ef74bmr61119616d6.28.1746198668404;
        Fri, 02 May 2025 08:11:08 -0700 (PDT)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com. [209.85.219.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f3b070asm19240256d6.10.2025.05.02.08.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 08:11:08 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e900a7ce55so38596036d6.3;
        Fri, 02 May 2025 08:11:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8UNIJoae1ldPW1t3DTUZdEB4omK8wWgctciw4al536hRZ0NeAymKC8STKCJk+8fnKuEwxCnR9Un56aUvumevqFpg=@vger.kernel.org, AJvYcCXJ0kJLUBRzzvEuojdApHvMfTg4S9tHte48Keifn9TyWak7yyHIwLlBptiztrbRlU7y7viMbzCwLppW@vger.kernel.org
X-Received: by 2002:ad4:5ba2:0:b0:6e8:90eb:e591 with SMTP id
 6a1803df08f44-6f51538e09fmr47555066d6.24.1746198667716; Fri, 02 May 2025
 08:11:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424054050.28310-1-biju.das.jz@bp.renesas.com> <20250424054050.28310-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250424054050.28310-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 May 2025 17:10:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXMgwWTMy89G=jPzNJ-mDP4OmHNUWChLQED+wUUS7vPsA@mail.gmail.com>
X-Gm-Features: ATxdqUEaxbA3BilD6_NKpKWBGwFKT-VDi88CMlB5b9RfgHeFzDASg2uVW40z2Xc
Message-ID: <CAMuHMdXMgwWTMy89G=jPzNJ-mDP4OmHNUWChLQED+wUUS7vPsA@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: rzg2l-smarc: Enable GPT on
 carrier board
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Apr 2025 at 07:41, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The GPT4 IOs are available on the carrier board's PMOD0 connector (J1).
> Enable the GPT on the carrier board by adding the GPT pinmux and node on
> the carrier board dtsi file.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

