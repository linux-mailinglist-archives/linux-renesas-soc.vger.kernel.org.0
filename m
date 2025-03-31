Return-Path: <linux-renesas-soc+bounces-15145-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2311BA765A3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 14:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A18B7A356E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 12:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36EC11E51F6;
	Mon, 31 Mar 2025 12:17:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64F413B59B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 12:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743423452; cv=none; b=SN6MK9MO6zkLn5hQg+qGL+SPZBpjllhTTgvP+svWHpvH5wrgP9GlAkjs60Qn+Hg9Spf8NJN3HQRZocs0X9RQyJBjlbF51WcmjmAnN0qa1NOk/So0OjsC98r4xijFGRR71c+EwMcmN43vzxHqtroqQ2Pn4iwOz48gzMiK7GBY0Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743423452; c=relaxed/simple;
	bh=XL2uFukJHiv9/+vyNPO9dwDoJm4rFasCFqHbi/RW7gE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V/IEVi+EXD9SSWOVu8KoAAP3Q2Kl2VsyCarbbzg77Y6/Tvhxb1t9b+iRc4AvVCYj3t7hFAXGrFf2XcvYTtFngqZA91nXaKS32Ibiys3NnHD7brPlDvX/LpzgMZlxBvkgdIqVOzN77ggUAyHAW/mQNkXC5H6jbF54st6KWOFhJ5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5241abb9761so1842389e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 05:17:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743423448; x=1744028248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ksf7zEponCYxXNAdB10vpnNW9aDhtZP6cHFJqj7Iec=;
        b=Z3eKgztRQoqD7rcwI8YpQp2xlt98Ju94O+fJvnyQYcii1ghggM8B4Dk154J1JrqbgB
         Q51C9QY1T12F8/Vknyaobivy/BB8Hb8NEkaa6EqKj2oR1Fl2Jyj6eg5cl5eK2fF+kXJc
         alEHX4Fk4v40mBxUMT3lElDghtDiZI2NtSnmOD7zVHuw6G/e3QTd8LP/+11EMpPBNnhF
         17KswU9OmICUA8ou919n5v9onc82nTP6i7Xw09Cx/96hTMJxIFjFBemI4k8tDEFG2Xld
         lS+Ape3CoNNICDtWx/r9+3OyAHaVOv7A6L7wu6VawKIR/KoTg7SdziKTwg0ewYQnwAw1
         Vs9g==
X-Forwarded-Encrypted: i=1; AJvYcCUwW87uoL5z39RKSfGDySYcucT5ua2aXuZGwSYtj9aYa67KpieU2kF62tvRPMYaVR5qLklj6NuGiu5Ita/ziccKWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YywEfz3oPaNmbXlbJd1QT5nRjRfA7433ikE3hsIRXezCPUvE8/k
	BrCF1pMbs1wsrrjcIAvBwa/R1tZtdO327bHhfPCoa5p10mfQhFmBR6vgYddo
X-Gm-Gg: ASbGncu6Q0wXO0Rx8//xkF5sQ+icrsIQ0YL65oMf+gE7lTJUU/ZIcgT5ugFVyxjrNsZ
	BIWNZw3BTSxBWxjfcjhC3k2ujCtUI4iRbR+qcPqWh1akskGK5t3P2Yjkg0OKi3cB5I9bEd8QYGq
	OfjIkCjJ0ImU0AqGCOUUak6PiPhVrecEA48wgCh0NMdnJsdmgVXbguRFVXHLfW5G09an3aatVtB
	iyw64a6qpOdCkAjf/WAs0RPW9CqtxzrcwRQW6J8mF9YCKu0hE/MWPL4+6EipjwUIjY9tbOpE9rj
	VXeW4+QTVTCEm0iuvnc30QrkIzXp2cLsSp0pOIRGhZi2u2fxJNVwB2RupAHSFo4Y+xv0c4zR65J
	61d78ocA=
X-Google-Smtp-Source: AGHT+IHr+0QPaxQM9vJVc4YhCIbRhlbizc/kl8+l51Pja6sWAIaKNigc3i73dbifmG9BJADGOyzW1Q==
X-Received: by 2002:a05:6122:400b:b0:526:1dde:3613 with SMTP id 71dfb90a1353d-5261dde36camr3678372e0c.0.1743423448250;
        Mon, 31 Mar 2025 05:17:28 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5260ead4fb6sm1505638e0c.39.2025.03.31.05.17.27
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 05:17:28 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86feb848764so1925443241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 05:17:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVayXXFH8VbVkh8x3DGAfIh+VJIkBgvpe8IBthLZSeFQ5aL9E95ymBz629zO4C7YBWunE6R3ug4aDm4HJbbfLW08A==@vger.kernel.org
X-Received: by 2002:a67:e7cb:0:b0:4b2:c391:7d16 with SMTP id
 ada2fe7eead31-4c6d384b45emr4666672137.7.1743423447609; Mon, 31 Mar 2025
 05:17:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com> <20250311113620.4312-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250311113620.4312-7-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 14:17:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=Le2WZGVDq9bK2PDen8u6SRONJMifTkGRt6TSD2UgZg@mail.gmail.com>
X-Gm-Features: AQ5f1JpUQbTga9ZXSd31w97U9ZyH0Ri0w5kZLNzy3n6ckpnLfk9wVpXKdHBjnjQ
Message-ID: <CAMuHMdV=Le2WZGVDq9bK2PDen8u6SRONJMifTkGRt6TSD2UgZg@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] memory: renesas-rpc-if: Add regmap to struct rpcif_info
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Mar 2025 at 12:36, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The RZ/G3E XSPI has different regmap compared to RPC-IF. Add regmap to
> struct rpcif_info in order to support RZ/G3E XSPI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

