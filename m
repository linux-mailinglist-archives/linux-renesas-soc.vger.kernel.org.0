Return-Path: <linux-renesas-soc+bounces-26721-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4056CD1E047
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 11:26:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32900306C40D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 10:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944ED35CBC5;
	Wed, 14 Jan 2026 10:22:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6106C38A724
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 10:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386176; cv=none; b=VuGCS8rgAHeTSNuZDnnF7eKXYJHWHqJUuCADKZbOTnfZ4EM7w6kT89b4cxFuCd8NY/Up0VZa2e0lBMkyxcnnyJ/HGgB0wOfsq+H2ukTsDd6NLOLZOAIZjqI+08tAZIsMvlR9EvjHMUe5kRvTXF0r0oDb5Q/gDqpgn9IfDp+hxHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386176; c=relaxed/simple;
	bh=4GqB9vyZU2yDv0/uVu6UpqHnTsDrDX9bTvz63MYsIz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ox4gc13ea4WMgVruaNPcn2wpkumNcC5fwEwfRn/9fDIGwyStuMQx0OscXwKhhqoKcwFFrsy2qq5fbNHpg1g+Nn7Uur+rQweSAve66aeLZqFJf7fhFfT5KuwF5mqNTE581glEUTUJJqjU6Rqm+FKR0phc0n9LEC8nHuTDra9Upn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5636bf70eb6so1253732e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 02:22:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768386168; x=1768990968;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQb4APq8JZCf6vJkgFja2UsHU1/oiSPOSOYM2wa7H1g=;
        b=dYP4nHPUUiFIPhs+Od3VdVK+iuVXsfe//FEpkbcEcTRURBgblN+RjG3cnV92M6IaPC
         4GfEEtQUU75F1jMm0XThTUJQ1asFhgi+JeoHI4ipQwVfz72fy2UeKauZFfpQHrDA1CkC
         RerQP6rdsPLvhZJP8NTNp9q1FguUsST1Kl4Czy1M2RFg2EskXSWzcDSR/MiQizYNEwVp
         Vi23IPd0teyDr3/nwIlsDpK0+UWs3auvkA6yRexkw7LvGO3mA+VFLLEpLOAEQYrjrFQ+
         8eeaPKnLhn+S1zk9Vmyu50Ks9Q/ptI2obYPn6vl+Pf5rU8H6bjxYakERJGdvG121YKol
         umSA==
X-Forwarded-Encrypted: i=1; AJvYcCVLYsGfSArD0A7DZjpM0vD45Tz4CzIfV8kyXwMhAjN5eiwf+NpPL0MRL0I9ns5TlJVJZPTLmRh3xzzUwvfZ+hxdSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyavy7z4Dx+FujbO/xBFsXclQ5sFhRShzMwRt8IEMXkjAau1EXT
	LarywCxuR0SXtn2z+6yRfc3VamaouWPawxNRBn7vPNXUc79Xj4mUIRLwhSKXwv3s
X-Gm-Gg: AY/fxX4cEyhbvY+7xQprTZXw3esp7MC61eLNgRDlLg5Eau51f44V10du4uV5zh2Brem
	K0dZQ58cOFHkrry6YOhBXozWgh6kRK3B1+2mw446omrGQwiu+G02yjNUaHXC+/b8KuHlxT/7Dt8
	fDteARYCY4C15Q03aI7U/FEWW0PUYeqg3Me9OcYt3YcXlE8HMKHo+1x/A5S3q8Vpf88nz/Kdn5D
	oidnEJYIjh82AdW7/+KUOKUgThc1nyVoYe/e3oMz/XQsgkEGYXhLLyfX5Om2p9UMxckZ+bQeeFV
	NmioxpvwtKzY6K9vpTn8C5eiuje5MSJiDsElWTlv4zbbi3DYgBMKbynbMOeP4aiMpfFphJY+5Wv
	C7VinwI/aXssWvDMJsdPlwc/FvjM2lHSMgpzE2CFCc6HIJss4Sx7tRY9IfKC1iZPD2Ti2wVgWMj
	zyfpTYtdy3hAg8XV7obyJDrjCRjun+1TqQ/wnasd65W73iP1dH
X-Received: by 2002:a05:6122:6606:b0:563:7d93:b135 with SMTP id 71dfb90a1353d-563a2050bfdmr394168e0c.2.1768386167642;
        Wed, 14 Jan 2026 02:22:47 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5638821427dsm8026938e0c.18.2026.01.14.02.22.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 02:22:47 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-93f573ba819so3399429241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 02:22:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWRjf7XAh7cbRbyf8LKWvhI4JwqKkPwaT818GvC0zzpTTjcGvIXCDRABluZnVGGbhm06X+y5LbCR7jd/FAx1aMJOQ==@vger.kernel.org
X-Received: by 2002:a05:6102:50a6:b0:5ee:a93d:2cdd with SMTP id
 ada2fe7eead31-5f183c02702mr366472137.40.1768386167018; Wed, 14 Jan 2026
 02:22:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org> <20260101203938.159161-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260101203938.159161-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 11:22:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWZzL7nUCv6LnDaDhpMwfrnJp3ZYPAqQtDJ3BsZyH9k6g@mail.gmail.com>
X-Gm-Features: AZwV_Qi-Eu9-CR2_DSC2JlXjPpAlkxhHqejeDJ45jkp3qmHmsOBPHJManLtOH4I
Message-ID: <CAMuHMdWZzL7nUCv6LnDaDhpMwfrnJp3ZYPAqQtDJ3BsZyH9k6g@mail.gmail.com>
Subject: Re: [PATCH 01/11] dt-bindings: phy: renesas: usb3-phy: add r8a77990 support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Thu, 1 Jan 2026 at 21:39, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> This patch adds support for r8a77990 (R-Car E3).
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml
> @@ -20,6 +20,7 @@ properties:
>            - renesas,r8a7796-usb3-phy  # R-Car M3-W
>            - renesas,r8a77961-usb3-phy # R-Car M3-W+
>            - renesas,r8a77965-usb3-phy # R-Car M3-N
> +          - renesas,r8a77990-usb3-phy # R-Car E3
>        - const: renesas,rcar-gen3-usb3-phy
>
>    reg:

According to Section 76.1.3.5 ("PHY Register Configuration"), the
USB3.0 PHY register block is only present on R-Car H3, M3-W, M3-W+,
and M3-N, but not on R-Car E3?

Likewise, Figure 76.1 ("Clock Distribution [R-Car H3, H3-N, M3-W,
M3-W+, M3-N]") does not cover R-Car E3. Unfortunately there is no
separate picture for R-Car E3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

