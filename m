Return-Path: <linux-renesas-soc+bounces-8410-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FBB961FB0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 08:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25A3E2861CA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 06:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51ADE14D452;
	Wed, 28 Aug 2024 06:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L88Qd74k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6D01BC2F;
	Wed, 28 Aug 2024 06:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724826375; cv=none; b=thAZjOqisSACZFWkV/fjKvEXekEaHPjr/H0zGsLNQ/HFQVY/dWMsAjU8KmjUnI0RCwhWoEYYqtDD/20/MSMgGQDaw7ss2+Id04uPTn2Yu5sudvHTt+LppnBVYswlDhQGr/QNe+tyhUuOGL+lyPYsvv4RTO65gAhf7akhdiwlDnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724826375; c=relaxed/simple;
	bh=z5um+F5kgYB+8tOJbQiMb9jUpaYqWQUvXy3B0MbjPEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M/nQoMDzK9CQNYFQDF33YwxG8dHdcy/t9XI9e1qDizBKuDNKJie+VlAjmrVrAoCrt5zyK28hIERG9vDrMDxRYgM5KI6nSDq1f+3MDqTHEGZhVg2Yytk+FvUBAroRZsgy85aAIy3suuHq8ch589PWrRZn+jyb5/cIoJmZTILOKQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L88Qd74k; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f50966c478so32247391fa.1;
        Tue, 27 Aug 2024 23:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724826371; x=1725431171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWJai3FOZ0aIfR9xP0d6XbyckawGCPeLPNcVBBq6JJk=;
        b=L88Qd74k/B94gOxKOyb2zW56GT4sBYhZqblElJNPlsd3ZMiWfu1TvuMi5I4AVAxWHp
         zHqI4jum4bHl8/Rdcj96UbhBjaiHGerdn1JcX/nDz8828voQyBUiCxfgjIYH2VpqkIK2
         8mwENVpqfY31WdLp+YvBLLFQjrM6/6Rz4tL16X18AfO7DOyaLEBFRsrf2NphNM+qX0rq
         GreadyW41WPLT2yslg/RCeb33Rx8+lPMUPYIppnE7+dik6N8npRWQbExuP+vf695wBL3
         K+PNeUbrk/tUTzHLqcB0DC2Q2Sj8/n6uxS/UIZRAaeb9UBMRDQcME5A6s9DTmtauxLbZ
         VGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724826371; x=1725431171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SWJai3FOZ0aIfR9xP0d6XbyckawGCPeLPNcVBBq6JJk=;
        b=HJ6MN4MMFbpRapbFAajTr2PBfrJSCh1xsN+uMFU32vvdyYrg2+B/casNjYKEIJ5OTT
         EDa7lCPYFnXJgZcUd+CZ1IM95lqZNJo/HaeBWqUfMJtgsTmBBOlxHJLfPBduhLdmW0YZ
         MNyPIkCGaS2FubnUFSJFBT8xB2WFe5y8GC0CyusaOO43lzsnE6NsKy0sbbbQXrqL4IfE
         mOaSFN9q47DC9nQoJHQuTUiO5WlbkOje81UQ7THhEbMkrqgMQDxH/jM+Yh0DpQvhn2X4
         WHydWRryaKdwmgg3MDg9sWwLeyGvKJnXo9crao4xKhd1BXo7PzWA7YfEYVGOB9+/7Sg8
         Gukw==
X-Forwarded-Encrypted: i=1; AJvYcCVcaEF4kOjb1vmYOQ85eZOxWwYHOEQs5GApLvGiAqmB1lF5ExVUr8k2+K1kYXnQZX1f0mpA2re2y56Tow+gIhmh3n4=@vger.kernel.org, AJvYcCW9Ot6qJDZMMoLTUciyE09Iistwp+zoiTO00J0likbMrLDt7yCwC4UrjMJwgQgJVwPYhbtJ/URV9xkzRZA=@vger.kernel.org, AJvYcCWw01cooYTUpIQxBdS+oSEkefo2zrID49wqPKMTFO9j+LQu1Guapb1+J4qQQFTcFUDIB7EuF2wL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+3gmdxdNG0aBAkNwszlOrQyUvyTqLYHfrnKkw3LcQ5puRRx3+
	+oH6BWLtayA996jG7F3MCSZHv6TYj6sciya2uEupmiqbXcGEdp2OPaDZ/rt2+o9YwCzqtjnGFUB
	UlP0ddhWb/54yeDa8CBQN6hd6d5I=
X-Google-Smtp-Source: AGHT+IFEt9p2w9MKV8Zp367JXiujuRIJ135e9+HM1SrHI5y6rzXoYwC74hSPlKsVxIIYV0RiBX5XsG6Gi1mRzvqKcwE=
X-Received: by 2002:a2e:bc08:0:b0:2f0:1a19:f3f1 with SMTP id
 38308e7fff4ca-2f55b64017cmr7038631fa.7.1724826370344; Tue, 27 Aug 2024
 23:26:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240827095712.2672820-1-frank.li@vivo.com> <20240827095712.2672820-9-frank.li@vivo.com>
 <20240827120953.00005450@Huawei.com>
In-Reply-To: <20240827120953.00005450@Huawei.com>
From: Marcin Wojtas <marcin.s.wojtas@gmail.com>
Date: Wed, 28 Aug 2024 08:25:58 +0200
Message-ID: <CAHzn2R0r9Jziex+7fyhPGaPf12ckwqZwO40bshDBGdq_Tyenqg@mail.gmail.com>
Subject: Re: [net-next v3 8/9] net: mvpp2: Convert to devm_clk_get_enabled()
 and devm_clk_get_optional_enabled()
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Yangtao Li <frank.li@vivo.com>, clement.leger@bootlin.com, andrew@lunn.ch, 
	f.fainelli@gmail.com, olteanv@gmail.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	ulli.kroll@googlemail.com, linus.walleij@linaro.org, linux@armlinux.org.uk, 
	alexandre.torgue@foss.st.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com, 
	hkallweit1@gmail.com, u.kleine-koenig@pengutronix.de, 
	jacob.e.keller@intel.com, justinstitt@google.com, sd@queasysnail.net, 
	horms@kernel.org, linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

wt., 27 sie 2024 o 13:09 Jonathan Cameron
<Jonathan.Cameron@huawei.com> napisa=C5=82(a):
>
> On Tue, 27 Aug 2024 03:57:11 -0600
> Yangtao Li <frank.li@vivo.com> wrote:
>
> > Use devm_clk_get_enabled() and devm_clk_get_optional_enabled()
> > to simplify code.
> >
> > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > Reviewed-by: Marcin Wojtas <marcin.s.wojtas@gmail.com>
>
> >
> > @@ -7745,12 +7710,6 @@ static void mvpp2_remove(struct platform_device =
*pdev)
> >
> >       if (!dev_of_node(&pdev->dev))
> >               return;
>
> Given this makes no difference any more, drop the above dev_of_node() che=
ck.
>

This check is to not execute the clk-related code when booting with
ACPI. It should remain as-is, unless the new devm_clk_get* api is
capable of not exploding in non-DT case. Can you confirm?

Best regards,
Marcin

> > -
> > -     clk_disable_unprepare(priv->axi_clk);
> > -     clk_disable_unprepare(priv->mg_core_clk);
> > -     clk_disable_unprepare(priv->mg_clk);
> > -     clk_disable_unprepare(priv->pp_clk);
> > -     clk_disable_unprepare(priv->gop_clk);
> >  }
> >
> >  static const struct of_device_id mvpp2_match[] =3D {
>

