Return-Path: <linux-renesas-soc+bounces-16969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 570C3AB33BE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 11:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 848047A25E8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 09:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236232550CC;
	Mon, 12 May 2025 09:35:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC1C433A0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 May 2025 09:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747042514; cv=none; b=u5kE7C3TW5uN8wUhyuAIDwmQBN4pZZ4Wjap+kl2jVuW5UpGyXctkLYDCrTplrnNPfEsY5/4vrqpWF318Tdpn9mvkz9nZ/V4BZnU4yZHwTqcbhxdhdOhSL6EtIcmvooHvUlUc6e2ugs9NRV4iOiIuTCKpknZDPJ8Y/M1M+5zRNHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747042514; c=relaxed/simple;
	bh=ObVQoDKUuckgW7L+r44ufSfyEy83Jr585eRCCBG8s88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nUwf4T3bfOu/Q5sY9/RQ6mG7IpO7lyZruc42A19O5WhRkbX4+HEbguuH9aegVS9qrteCxfHoEgRsntyMd+ClG5AyW7oZgyxiSNpXymV1nbB8EU8tYHc6nD+NhILZXvnx6ccvSLBh/c/cJ9/68njVkzc6WkcARxOO4Sy6GwqZSDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-525b44b7720so1429486e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 May 2025 02:35:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747042508; x=1747647308;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqsPLv9uSuQweVXtQM7sHRJP63EkcIqTxw+FruTh/k8=;
        b=Fx1UUNLBtCJWe04uNxUXsE0s7rlTzif+JGUbJLX2vhr2NsS8ZCZ/PrMg4Z32hkzy3Q
         mdQ15s0Yji3himbcbew3CvXVopnB6YYcSfGPRhsz90kmjJv/a6iAPrrNx3UsJ5qv0RdL
         dWOwjT60RE9IHp+rHfrRVDQX7QeYZ8Y6FuqnsnOK5gsukwKe05czRct/sOIQNw8F/hcu
         tu+MGSUXcvUpmVXrxnHxx/bJ4p3Fu1dTSbcoUCBIXLMzKsb10+wDDC3HRdueDeNgDtJi
         M5X4FJ2mO0J6DWzTEtX40n53kVa4SLRwD1bM9WAk55bzxaV9HG9T2QFb4D5OMxHqTQot
         GStg==
X-Forwarded-Encrypted: i=1; AJvYcCW34GGyI9p8xxF2c+pXd8vDdcDT8T5xbFhlZpx0G5Ba/NmMNcPGmjwL8/hhu6BJPYwrqRtY2viUg3iDVjsLcu9pLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZpcwAoAob6B4Ztz7PK42+DKXfoppjjMrEzMZ+1IA/FIWvoURg
	gUZsLHWUwRkkbLDFKiGnF5v1MDQAOpg5kzCTj2VH9jQGR3YFwfqA29uVjwke
X-Gm-Gg: ASbGncvHcIwKVMPCgUGZAnCz4LuRk1EIRy7kuhu4Q3Y4dNvTWegAJaamphto/V3jCa6
	02cdDYjj3BGMQ8RCjdWYn6jUvVE50mwQsvTmBxwFTF9FwEMRFhqfD8T6vySNyxGr4/328SLSD30
	VCAhPd/Xif9nAjtHxTtWgJ9imJP94EhalAmKEW9nm+pWHbjUrlvGamYpvbTMmHI2ZLFfrljAMVV
	uDUqqXCxtTkAWbAEke90rilCrBlb+lze+ronDwj7gLFvgCXYcUqh5X2k2/g9C/GE+MZKrnbXfXW
	JWVsnw1G7dtw0R5BMlv8tFGT3fuPN+phaURq+LrlYMCvOzarzFo7QoeUelViNjLkEkB2bAdiYpC
	Ylmx/9IXGnOz4iQ==
X-Google-Smtp-Source: AGHT+IGIBjpw5YnDFLQpZgowv2lpLZqmIA4cV9GtHhMgy1U+xCHKxsiT9Edi2bYM42imoS+HeArJfQ==
X-Received: by 2002:a05:6102:1504:b0:4de:1ab2:ac67 with SMTP id ada2fe7eead31-4deed2ff098mr9944502137.2.1747042508231;
        Mon, 12 May 2025 02:35:08 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dea85d7c32sm4676910137.15.2025.05.12.02.35.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 02:35:07 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4de9406bcf1so1304791137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 May 2025 02:35:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMTLqnDdamRW/AiqGZJzDr4jFVO3fTozNlED15C2FKXR5dnY3OxzN3peVNKnQEZcOgcBXmUY7wjTwK5DhSkL48nA==@vger.kernel.org
X-Received: by 2002:a05:6102:4b19:b0:4c1:76a4:aee4 with SMTP id
 ada2fe7eead31-4deed3d366fmr10212836137.19.1747042507550; Mon, 12 May 2025
 02:35:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1746798748.git.geert+renesas@glider.be>
In-Reply-To: <cover.1746798748.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 May 2025 11:34:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWHy6_BETqOOQqRoGCt8bdeG9psttm--g3kfP7jHZY0KA@mail.gmail.com>
X-Gm-Features: AX0GCFu6jsWjeoSVukB3E2LeU29ISfDMzfAZwuaDhJIL1puAnVS2NMOwOsemz7k
Message-ID: <CAMuHMdWHy6_BETqOOQqRoGCt8bdeG9psttm--g3kfP7jHZY0KA@mail.gmail.com>
Subject: Re: [GIT PULL 0/3] Renesas ARM defconfig updates for v6.16 (take two)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 May 2025 at 16:22, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> This is my second pull request for the inclusion of Renesas SoC updates
> for v6.16.

Oops, subject should have been "[GIT PULL 0/3] Renesas SoC updates
for v6.16 (take two)".  Sorry for the confusion.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

