Return-Path: <linux-renesas-soc+bounces-12401-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8A8A1A71D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 16:31:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61F42161CA9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 15:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A2A2557A;
	Thu, 23 Jan 2025 15:31:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8561F4F1;
	Thu, 23 Jan 2025 15:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737646262; cv=none; b=TYrP1bAob6N0Pr32hkVnhtEY/aGX4NKUJu7B2tiIy9GBsknRCftyVGnE6uptfICoJ/ug8DTYWNiVo9Jx/tGZ35wczgBLqy0F88GYhp+Rn5vwXX9uXVFkePB7rdJ3UFf5siid5r6MHapOxdjFu8hwtm/S9YpRsdATjBKrTCIbeXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737646262; c=relaxed/simple;
	bh=zvFZ2s9AkNu92i4NGITWR2WdJUYrCgFa/AZDjA86Al0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M8jye6StWZpZf0Gn0/juWvhA41aPKsfk1/0ciw/QyGQPPP+EDbEhr08uN+MvtIb22Xx/0LN5FkkjlLIspjFKXwK91CINTHfqPKX1plM+HL1i75J+OM4qvVl62GSSbIrnhkCe3kXDSI4pytDnO7MOobCMMuT9WEtcTpm7U4Qpcqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-85c4557fce0so217118241.3;
        Thu, 23 Jan 2025 07:31:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737646259; x=1738251059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TN/9t8eXBgaIlZnwRxNux54CYSOA/PQxsbMhs+U3oPg=;
        b=srI3o9wKXOPGsTAv9k9HulnVN5lAeHGpivchEe3AjOG19f/G6iwsBW/lf9/D0W638J
         6aKsH3Lpwr+AABADMzod+5C9Dywi5UGre9S5m5mOn14Mn8mLnzTB5XiNqt6VzjnJQ+Pr
         WvvVNDB4NgKeahuEQT8vpL6SpUFZ5ux/lCsM3XCjIkv7adkNt4gqpSP+3U2yIHBo4dUy
         1l1BzHexvuSyA/utbUMwghEssduU2lj1uAbXQVNHASEJHDsix7b0Wrq8uheugxXeuDG8
         iF8RMj7BbCHRznPpqHmA5kxE3nzEfgoX4VfDlGVdmSlU6fm6t/rbdf9LSetw3KNj+exs
         J0kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKslFxbIsH62e1nP8HDh4Gsm22OlRFvXw0C8lvu2jNO8Dr91ldiBkX+xeF9VOtyCOdNai3WiG5uAzj@vger.kernel.org, AJvYcCXLS/BY9sS/pdE/9WwIzkCmdum/asKJQy1+49vlvvRLLUaURkJvzgRJ0tZKWli43zxOhtq5MC/AVvn6kHffo0xxnAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKzMsRmMy5AgAG2LxHKp/06I7tZ6SlwpDASG0AVKAKW4VA6YrK
	A1uXE+2PcOoEQO9Lke5JA0zgIXb5cVcagp87iu2KX3Uv5t4gBVO0RRhbtFSz
X-Gm-Gg: ASbGncvbxTX2s/k6G6yQGRtddgOssz2MNb+UElCBqbAkk7/fQo3ajqbN6ON9J67OtSC
	OrmGIotxGve26+DrlgnaZBAEonbSM7uouESOov8hKCEMNEgTDv5rIQmgQHGIyTYnLtmZaxIuZVB
	yK6ytio67ZNFV9qwP5fcMJ/nxgIeAN+d9IKpiUueJsH6YSkcQNMtfegxBihz8J+0bOnIYAo5/vK
	FF7md3M3HXrubmXuNmBHV+zMvS1NGvEfw4AAsLzLLuzRS0m/0QuzPe2wLyKxPMOobDEkFquJwxJ
	d590zVWM2zkhqKgXqrIaB2z6pTfnNAXICguW1AtCX0A=
X-Google-Smtp-Source: AGHT+IHHSOIUPHqsX6ICer9eoZOPYMSWzDlDxtu/qkjTkl814VoqKS/Lk7zJ6Arwri44rxoDvxiRRQ==
X-Received: by 2002:a05:6102:3c8d:b0:4b6:35c4:6fcd with SMTP id ada2fe7eead31-4b690be4319mr23018169137.7.1737646259428;
        Thu, 23 Jan 2025 07:30:59 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8642ccaf42dsm3527279241.30.2025.01.23.07.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 07:30:59 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4b11a11a4f0so311247137.3;
        Thu, 23 Jan 2025 07:30:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWSxwE4LkmWTyviwrmRzloanV/a3a8MD9YzlRl4fuv7XgdHPEv0t0oP2NT2ljB2PfTCv66OpKZ55RRc@vger.kernel.org, AJvYcCXzNgN5R4EcdUJ4UqMjnLhsmY69WpdH1LshvH+th7W8JGWiuEPy4Qm5tyelbQ6zvbj3TbkafsEP5K4VFoK1er0wfFE=@vger.kernel.org
X-Received: by 2002:a05:6102:3ec9:b0:4b1:1b24:7241 with SMTP id
 ada2fe7eead31-4b690c3a394mr21772836137.15.1737646257660; Thu, 23 Jan 2025
 07:30:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org> <20250118111344.361617-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250118111344.361617-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jan 2025 16:30:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWOCexS14ZSN+CsH_ZxY5idiZGxMAjf1iOu8=KgKJGQZw@mail.gmail.com>
X-Gm-Features: AWEUYZnagvprOTPn_RWtx6AJwf07Qm7tKl2Lpn4NkCZVtWnZKkLl_b01qKZRVWk
Message-ID: <CAMuHMdWOCexS14ZSN+CsH_ZxY5idiZGxMAjf1iOu8=KgKJGQZw@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: spider-ethernet: Add ethernetN
 aliases for rswitch
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 18, 2025 at 12:14=E2=80=AFPM Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The rswitch has three independent ports which each can act as a
> separate interface with its own MAC address. Describe DT aliases
> ethernet0, ethernet1, ethernet2 for each rswitch port in DT. This
> allows U-Boot to insert MAC addresses from its environment variables
> ethaddr/eth1addr/eth2addr into each rswitch port nodes, so Linux can
> read and use one unique MAC address for each rswitch port.
>
> Note that it is unlikely this would break existing rswitch driver
> operation in the Linux kernel, because as of right now, the rswitch
> driver already calls of_get_ethdev_address() for each port to read
> out the MAC address out of each rswitch port DT node, and if that is
> missing, it falls back to MAC address settings read from the hardware
> itself, and if that also fails, it uses random MAC address.
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

