Return-Path: <linux-renesas-soc+bounces-11299-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F4C9F110E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 16:34:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCF462827C7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 15:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523561E0E10;
	Fri, 13 Dec 2024 15:34:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEAC1DF988;
	Fri, 13 Dec 2024 15:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734104072; cv=none; b=SnZNaAYqhXy3sHpIVBUI1e5UVZKMdH+6lQyK66eD2+EGPWpSN9v1wtQKuQqs2ljehv8uiHg6h9kXIN8zXpYgufgj37t9IgT8pk/BUrx9HcuPWM07wKeXieNP5Z2efT7kXw5LRXEpktufMZTKH76GN2TXxHvVT/u8whW6SmWodaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734104072; c=relaxed/simple;
	bh=ER3me+VZDhAOFJQ8ficWBzHanTi8qpFOdS3sPlmKVyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EQ9CVIxOxKjzWTIKgtuXLgI382pirNhHgJ1Iy6WIG2J294X05+/XlkkwDkdBBZcWO1bUfUAijaktGwEAzhmUzMxkdridbi4Lf0bEG1hWwI49sUSbiuHnvriKDiYsExy7fszVFcgxdEoPxkQswmQpxRGsiWYt9f6wZqmytE9TgnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6dae1690c3cso14803836d6.2;
        Fri, 13 Dec 2024 07:34:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734104069; x=1734708869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4O3fLHyjMr/J2JBDlQ4jAGfxZWNEu3n+uKu4G6HEEQ=;
        b=RloLKnSbATnlUnPLT7xRGpszABtJCo8WmWtlCfX6qAb4ccN4VDiee87J4e2bgeI6CN
         ZSzA6BT9u06oaUqyCG7pX7EvIXIGhwoI7PE6j4n8KAfPlx5Srd/puoy6DDBIWlXTCX/v
         NDZkTw61LU7Hf22T7IZ0jCjIZgVetWysMoO/VaISO0goHhvYL7fU+sFEMa/DW1Ir54D2
         k6GoQ4Kwz6Yt/PEuAfZPC5359fojvl8a3q08U7gxxCBB7ViXmBi567DvV+aSVIlJOlRH
         ltl1V+Mt9qFH1l8RZPHwKVt0vYVfDcdodEO5kGeu4KEvtGHsfC6Y9v0aj4qkQr/4S3gQ
         6iig==
X-Forwarded-Encrypted: i=1; AJvYcCUAWpJhNjro3Q8vEop78Mcf6DH5k9fO6WbRZzI8rWZf//Ymjd+jtfbR271s5tWOUPZl45YEbcASJnZNDFGcUA4gnlE=@vger.kernel.org, AJvYcCWBdGPprkvG7csl++dr2YEn5ysY3++rqcqD22+V3esKBuOoh1f7br1qtVADs/TsfrFqX04HXQ3V2GDn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3i3mqTByOQ8PXOFuIociuN+4A8gDroJuv/EWrANNuZrR8J55D
	g0SSZy33nyxZR8lgRfAxmXmRH8AGSwGCVAJ9MT/CrY+NKx1B8PqSFkP/pUJ5
X-Gm-Gg: ASbGncvP7j60OERHIcatydsUJ4rXRw3GQRWPcGfhNVuAN20PgvAMGCoEy/f4hDTl+8o
	03ATs5kQvsIzSz0NUtfcFu87EPbDnzATpSELJLjyWd+ory+jeXFIV1xqZcWBc8sSbV7Vr2Cjp1E
	nGcQOajmKJLKtphqibBGlW+RWCbIIDFwFW05z7mIdrPMQ0ZdrW59fggrO54YOrFYJCE4bmoMMUy
	JnsQvnnd6ISLH8vo+MKi8z5tnepTFwnu7oPlQ/Ns6Iy86m9rGE0KQNsqRK64ay2iXGEicVb9GJw
	eBnmmme9yYaZ+o0yqb5jzzs=
X-Google-Smtp-Source: AGHT+IE5WT/P+QngRWuuuMNBcQY6QyQ5rsAVH2r2Nm5FDdluPl+tLT/lALuqbF8NexHyLQp18wvbvw==
X-Received: by 2002:a05:6214:76b:b0:6d8:a9dc:5a65 with SMTP id 6a1803df08f44-6dc968489e4mr50324866d6.45.1734104069440;
        Fri, 13 Dec 2024 07:34:29 -0800 (PST)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8da9fd389sm93185206d6.79.2024.12.13.07.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 07:34:29 -0800 (PST)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7b6fc3e9e4aso73908985a.2;
        Fri, 13 Dec 2024 07:34:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUDzLqtZ/H1sOddyNl811V5pKNPrb2Wa5IZWLXAC+QwMtc6uEVgMXmmAdq476f9C+h328gUxHvzQvvHWgmSJp8JQc4=@vger.kernel.org, AJvYcCV7yNbiaITHB30itpMd6/3oda+o3rPz1v06NqHZVNz040xoWwxVqrxuSmxAcisYo/3LT0G6oay+XxsV@vger.kernel.org
X-Received: by 2002:a05:620a:c47:b0:7ac:c348:6a55 with SMTP id
 af79cd13be357-7b6fbf3c4bfmr335611485a.38.1734104069082; Fri, 13 Dec 2024
 07:34:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206102327.8737-1-biju.das.jz@bp.renesas.com> <20241206102327.8737-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241206102327.8737-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Dec 2024 16:34:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWrzY5iE36iWFNczVz8LU8yD7QUnpG731ov0oDToE5Fgw@mail.gmail.com>
Message-ID: <CAMuHMdWrzY5iE36iWFNczVz8LU8yD7QUnpG731ov0oDToE5Fgw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: renesas: r9a09g047: Add scif pincontrol
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 6, 2024 at 11:24=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add device node for scif pincontrol.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

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

