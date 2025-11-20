Return-Path: <linux-renesas-soc+bounces-24876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 47624C731D0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 10:25:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 57E134E677D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 09:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5DB13126BF;
	Thu, 20 Nov 2025 09:24:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AAA2FC882
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 09:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763630697; cv=none; b=AYNS+msoqBlheTyPgGLpPrDEaC9aZw5+0nz71ZtDedym53Le2VGysAtQA0r5wK/lj20QFiF7hE67Pw95pIMfh4RYHAzwP8mFv9x175JmKqdggkAKDYUC5KIvCxEaYk7a3c7zkNlyURqJRm5e05nYp00qeekWvq3bTBPZO9BNDc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763630697; c=relaxed/simple;
	bh=1i8n6sQYAQYGK0fiq9gy7JmBY3fEL++SH730vZ0ZpOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XLkSYGzgcz7Ah0EKn6EChDv7kOCsl9HLv0OJ/8t468rw5qGGq4UYRHgd60Ov+Tw+5Dc5z5zclRJN3Y2TGv/JmVYJSa57jp2XzUh0hQdQ/7ywIuAKceI4aW+fAqJNwd11TurcjnqOeelK0fqGFfysDiwM/dTES6OiUTjNJ6VXpcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-55b2a09ff61so147494e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 01:24:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763630695; x=1764235495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXwxGDz+sQhLdMTJCzGWdGoPN68wRb9kpJwdQDocY0Y=;
        b=Jjv2rDVdFlf92Oft0huy8ZJTcBrleAYbRwfQPdp4aQTF31s/yttEAd9yFl2N1AieEV
         6xZR4+4rqT4U2iz6/ojqgYSZNGb2By+mr6Ws5fadIIr3neyKlE7ZU2xOYB1rmvKAN3yU
         eYq80EWvg8w7mHwL/PB9hRJrGmOBce2IYPZxgOQv9AWFoLy/EU8yq5oXtsOeWll/nfAb
         gw1YtyOs/CKc5rqAbdAXC/kA1gJkWGEMz1EPRzMFb6tVCXveNK5tsMvqao/4Gu+9m8gl
         wnK/L3liJuEzeFBIYrz+obtjyZVkzR9h31P+RvHIlvZQIXDXF5WAtNaG5UjxcQOi2UrW
         +AIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtOdETBLx95H6PkV3AIDZ3VOEXnHRIxF1Y+jwejW8aAAIp1s6A27wIQt3M1tOC6PvAUzfmZjjj13R0nVr2WXdLDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVqSEauZXxmIDeUlxeW9cOCu8GtpMMCSfFDsdirYCsZnPFcCfg
	dpM/0iO/T1eE3tW1kedm7DAbvSKNQZ+J1q7t2cuLmrut0j/nTCMZ3g0k/PJBK91/
X-Gm-Gg: ASbGncvLteC/MOI7vD5nJQGxiwEEAaLdnKplQ+hVgY72oTMco7QHUfrnr1X4ADHs7ry
	gNpqYLiZwg24zVuvJvzQ4M7kgOXXmWodUqlVJ/FD67UaaI3hd5aTUU/gtXVUB8lJ8MAIn1WArjO
	SnuhL/LCORMCnsuH41VBRC6iC6TtdW2gto4SoQthb54bv0fmdmFNRS2Bq1tYatwRmh77Yg5B0H+
	NQKBrhD1rHapivHarFebAuWMQssjVoAem9P31VDyDafxjvw1+nh3E6LuKnP5IyHM/ftWppRgGN3
	y32q0Gw2Lo9N5dKzBK6+n9urR3Z5MbahKEGnPu3MwBTnuMc1exFqJvjgMankUCPx7mvuzIBg/3n
	nst4QADU1s5uBzS+fNSzeTO2KcwHyrAzxV83/mJLh76v2ZhaJ1CpTDWr/Fv4C5P3xwjILoI53WV
	m4Kl/TfdTYEvg8rHV/n0HED2OV73zJnQlDBtZiCXOjvL66hTvPYnel
X-Google-Smtp-Source: AGHT+IFASDDQrNeAUlWROCCahBGDOAAQ5xTefXPfGmdJjRCEgmGNRDZUe5KXz4g/LfmXLTDOdPos8Q==
X-Received: by 2002:a05:6122:1797:b0:559:6723:628c with SMTP id 71dfb90a1353d-55b7f246934mr751164e0c.16.1763630694943;
        Thu, 20 Nov 2025 01:24:54 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b7f60308csm808839e0c.2.2025.11.20.01.24.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 01:24:54 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5dfd0101905so243938137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 01:24:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCURI4Oa8Ul+E05ViocWN+Dnym+T0Gh+AbDlJLs0NUAqDU7vRMjbFzr6UZeoNVW0iSv16ximA/YzjWlQnMR4uFiL0g==@vger.kernel.org
X-Received: by 2002:a05:6102:3f44:b0:5db:3b75:a2aa with SMTP id
 ada2fe7eead31-5e1bbc97c48mr726927137.18.1763630694004; Thu, 20 Nov 2025
 01:24:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250916150255.4231-1-biju.das.jz@bp.renesas.com>
 <20250916150255.4231-10-biju.das.jz@bp.renesas.com> <CAMuHMdUVrxtMoR7nxrVwuDuZRNpG1a41OfRJm521vo=S5EOY8A@mail.gmail.com>
In-Reply-To: <CAMuHMdUVrxtMoR7nxrVwuDuZRNpG1a41OfRJm521vo=S5EOY8A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Nov 2025 10:24:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUNzAWsBKb7q+dhfx+egqL_GebzKPGG7q+8D6-qj-PoHg@mail.gmail.com>
X-Gm-Features: AWmQ_bmUAKQHJxMC6DmZamUNe0bL9hIoM0XydP660aQR-BfX03am7fjSko9ID4A
Message-ID: <CAMuHMdUNzAWsBKb7q+dhfx+egqL_GebzKPGG7q+8D6-qj-PoHg@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] arm64: defconfig: Enable RZ/G3E USB3 PHY driver
To: Biju <biju.das.au@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Nishanth Menon <nm@ti.com>, Eric Biggers <ebiggers@kernel.org>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Taniya Das <quic_tdas@quicinc.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Sept 2025 at 14:28, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, 16 Sept 2025 at 17:03, Biju <biju.das.au@gmail.com> wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Enable the RZ/G3E USB3 PHY driver on the Renesas RZ/G3E SMARC EVK board.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

