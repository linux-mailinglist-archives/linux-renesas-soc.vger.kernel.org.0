Return-Path: <linux-renesas-soc+bounces-16015-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B98BEA8A124
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 16:34:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBA44179326
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 14:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99D327B509;
	Tue, 15 Apr 2025 14:34:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E716C1A5B99;
	Tue, 15 Apr 2025 14:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744727680; cv=none; b=EHm9EgeKdqgaIL4nqU7m9A3yY/c6zwh7sgdVXQH9zDspBPoCT9khpHL6Yrt01RTMneTm7f/sD823aD2AQ0VwOoQ7dEMy0C7r3fHs9Od6eQlxsfxnRRrP5OgBMzjeo1JMKQcL0GUP62dfn0N0+zmJP0/WtZlotFo4nyE3h/U+rIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744727680; c=relaxed/simple;
	bh=Tl88dRk9WKzmD4PTHVVRWupHls5Z857EJ26A6giTmWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iU7K20az6vYQYvXI/9eNAHgfAF7Ph3Vd3WaHuT6QMQb4U6LuNXVJp+y1UmVmEz+xr9ZTch1KtJEID7fNHCKVgthySDetFR6scMRrf4PREiGM7Oof/cmmzeFtw1UFQAFJwALLuTdzzFF1SZvmqt8lV08AbwcnR7JwNvOgtiJgTK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c5e2fe5f17so552875885a.3;
        Tue, 15 Apr 2025 07:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744727675; x=1745332475;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCNEltMnu4+e8+YmO6/m3JW1DrooVatnpehCYQVy/l8=;
        b=bajhKSogpJh6hqmuSCeOpdE1kRREo5mpidzcVbFIuBuCnn9Bw3uzSZSxF1+at9Kt6t
         yEKRlkouz6nR1vBWAoi/h3I8TdVQrhPFfR9N3YLpI5cAOWw6rvf6QIjgqc5a+ksb7bsj
         MqkUm1CgeWutXMnl9BaQVti75RKusC8vCJoMBI3o4nmRHjbcVhRgsfuV7u6G9UrDzB1a
         HC5EBrOQAyS/sJw1XBpnxMkb17nKONLpki3POgb9sLLmTQ9cp/C2PqZM542QRSSTZh8y
         QY/qPyzkzaK8FKq2xXWZ2jpSZoScimlxkz5vgU44tzAKH1wftQTgrMakj5tJk0bopE/1
         6F7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUWgGhYYjVedNaq9yqBBltLKiWUJ3mgfjAOJ+RTKbYeDFB1q/maHYSE39jXpXsiwW4yDYCzUPS3PHi@vger.kernel.org, AJvYcCW56wA4EsQGlyA2vyaMLU97gojEZ6p9ByDZxUqZ5KT8WnZQK9e40rIIJfsWEB/PQfYOTy+gRfxu5ZpVO/3I@vger.kernel.org, AJvYcCWI1lc59dzRDpulDnoVvdzG1mlQ+20vZS5fmlaaZQsFH1kzJdeFyo7Keok7drHGENvmqruePNBrOgWK4AJRP3+QJ3k=@vger.kernel.org, AJvYcCXCdABpVZ+bdrCQEbTNxneHXbZgPaffIEAuuLBDI4xkGEGSCG35nr35oNGQXfkv8Ul4vXQ5C0Pt6h6P@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ4+7+e6vfECmezmctQzogDAvwppHJ061KwgQIDo/rTGOh1t//
	AXIMX69HKI0iD0kv+4AVVqZ3UVQ0f3MZ+8gVfI5dWX3DXJbNINU1dYx1UClK
X-Gm-Gg: ASbGncsuCdOXnfpt8wHcicTnYyobef1wRM6u0BjMlyifUgfHvOWk2xNLyv12493Ef7n
	oNHjkd89J5jeFKmIyyhEo7/6PrDygHrrdlCe3zT0NGgg/5IJzsYAzUIQwNvRabB39G2bzD+Q64V
	eRGigq+EGv+gIcvtv5BFGoEPm0ewMGxFf1O0om5aqA/h6myoAxm4D35m8x3Lw+DHl8hYjuZaZFa
	O5nU1pViGfyq2SAtlSk0n3X/W4XSejN0JIJV+hw8VIo2f/6J7FRxw+keEXFyme4gYuET11Im2hP
	EUbcztD5iBZHm8UPuSa1LNAKsLT0S38VWr1sexCkMrg3t+GyXgoipkwPXseUN7wa985UhTG7PPM
	SZ8SYnL4=
X-Google-Smtp-Source: AGHT+IHne3ZR05vW81ZI4/ekMIwQ83viymfyihZ+pOWgY2ocQ+qQTyPPS97AUgm+/IcVsElPcMvM/g==
X-Received: by 2002:a05:620a:4148:b0:7c7:73cd:1475 with SMTP id af79cd13be357-7c7af0be293mr2344667785a.3.1744727675577;
        Tue, 15 Apr 2025 07:34:35 -0700 (PDT)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7b7f75717sm599445785a.70.2025.04.15.07.34.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 07:34:35 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c5e2fe5f17so552868385a.3;
        Tue, 15 Apr 2025 07:34:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8S5Cz3JRL114xdEd/Ws8HZh74lFbSRQ0h92RBNoobGrg8wAwEoXeUz+UGAPOSawgyMJg8p4uyrDLGmsdhzn3o17c=@vger.kernel.org, AJvYcCUb3HGreCaLX6vh6l0rfj/SuqMXXdQOETGfUN9ePR+diMrmB77NhJZ9/sdL8eNSybFxV0+TJOFgzoT2mt1Y@vger.kernel.org, AJvYcCUoQdtj3NwawuqiYGxzZkAuEpBc3EtcxI+q6QyfZsz2MCskACcdsYzYE/qDgrGkhoAFMr65u3K/mcoY@vger.kernel.org, AJvYcCUy7mXZVVrUmtH5M8KgRvu1e+uloRfnf5kjGwLRNDuUsLXPOJwiEGGkj9B6pNQmi9T29iPKDZwI2EQ3@vger.kernel.org
X-Received: by 2002:a05:620a:4694:b0:7c7:95ee:77bf with SMTP id
 af79cd13be357-7c7af0ce3bbmr2087309785a.19.1744727674510; Tue, 15 Apr 2025
 07:34:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250407165202.197570-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250407165202.197570-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Apr 2025 16:34:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVT9Pc3if0CRYWcqnUDFPt-+wwkGK8heRgxKeMGocQkkw@mail.gmail.com>
X-Gm-Features: ATxdqUEkTRsO-w3hqqcgyBvHiplctB2HBw8BUb3INu57sjzkGSY940sE3DaRIPo
Message-ID: <CAMuHMdVT9Pc3if0CRYWcqnUDFPt-+wwkGK8heRgxKeMGocQkkw@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] clk: renesas: rzv2h-cpg: Add macro for defining
 static dividers
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 18:52, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Unlike dynamic dividers, static dividers do not have a monitor bit.
> Introduce the `DEF_CSDIV()` macro for defining static dividers, ensuring
> consistency with existing dynamic divider macros.
>
> Additionally, introduce the `CSDIV_NO_MON` macro to indicate the absence
> of a monitor bit, allowing the monitoring step to be skipped when
> `mon` is set to `CSDIV_NO_MON`.
>
> Note, `rzv2h_cpg_ddiv_clk_register()` will be re-used instead of generic
> `clk_hw_register_divider_table()` for registering satic dividers
> as some of the static dividers require RMW operations.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.16.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

