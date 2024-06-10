Return-Path: <linux-renesas-soc+bounces-5987-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E63F901AC4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 08:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E81AB23C5D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 06:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7048C200AE;
	Mon, 10 Jun 2024 05:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="K5yNUOcG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF4F225A8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2024 05:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717999039; cv=none; b=OxZ7MBagl4YFntMvf+96HAx9dmX0sBaFP1zNaz2UEztJ7IaLvytD6Oimgcbv4lcPxblTSsS0dt+fgQFO2y/0Xm0Br5ckZp0eQ+dbh087phuaC8az95yoqcq9oY43L6stvSzGiDXmssnj7mQQP1sqQT6oPpSUUjinyOLMx6cOJXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717999039; c=relaxed/simple;
	bh=1/vAMTbq3ZBiRUGV1BfzxoHRsbHKecxbVfTvTcOo+68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VeEQ5BppjUw5BA8O6wIa6iYiZaq9cUWSwHZ9KE3/5Go3M+W6jii4JJ+Zy6r3mQyrEVFLhuRCBeIKHSbEzU1Uwwd7bUw8kDVQOceC+Jr5tHRiJAMu/bjnR6uTFXPm5Kw7rAjV3NxkXiwaoB72dA2X8aimKfFcmXa2Ob5stjDwiKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=K5yNUOcG; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-35f223e7691so418760f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 09 Jun 2024 22:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1717999035; x=1718603835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c5zOFAazIMlIFvhZhDihadnq9wfYmdHFcKUSAGOnXFo=;
        b=K5yNUOcGY28ABWhgUSEKLA0BhUlePsziiDRJ1CaQpJpyhIsaabUV/WR6DTXP6Puy0i
         myPxC4jmpizmodhoydAxd5GZ3Gq1Ge3GRcmq5/q4i6N06kRvFtB+u2WbCoLwQRra7qje
         Rd4Sd1/Ck6jUOX71fdG3UvOnMOju7ufoXYN53DivL7GaAe5Ymh/6RDYiJ3cgb7/gzFVR
         GUpBDNRqVFTzcQC2B4iEqG4mzt2xwSR2Ps55HQ275kUT893hW+ofgp1pwKbg72MBXAAh
         Tsue8rOHZboxfCzcmcw6X1IEan1pk0ZZx7VLz6nMhjVg8oyHHJNCiBeZXpi9Tmk+1Oj0
         XBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717999035; x=1718603835;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c5zOFAazIMlIFvhZhDihadnq9wfYmdHFcKUSAGOnXFo=;
        b=bzQaCfybXiX2AI7cJvHvpGxwFqzlZ6/Z6keiMVStMBFK9sNtCn6CUdMrYw5PZVu3z8
         QN+3v5tLoZWAWF+EaHpna30kVBszNyWKZ6+9k7i+pRciaMh/FLRAcQ5p9FlCRxnFk0BF
         CUvfqe0nbKQX48c1VZP9qdkUQNVT4YqYN8H/Isn1hPoh9PHCRPTwOu0QfnkkQY8ZQg6l
         T16Mng0jbFeG+0S2nxwtdIukOMbdat/GzsUhdUYIZ/UrX6Tqd6uJqyBAuEm9hbrRESo3
         uGCZmyV3fDtvM64DTSWua1VXGbj1G/irbR+io/bkrAWGY9Uu0CYRsqpWrSVj35lk3q3O
         7sqw==
X-Gm-Message-State: AOJu0YzXbMtS3Oltr1LTswjwZk5fuuCEEBiY78NA/cZykhZR9U1GoTzZ
	c0Z5WV+JdlPiEyW3FMQVkqK9DUEJYFDQ0mNU2/EFR9NNQWCh3wSYU2IHI6qXkUI=
X-Google-Smtp-Source: AGHT+IGVumZGSFnDHVppYevQMMMEsdzJ2eDAeIRuctFbzJKUmRaBmB6mVqMLLZKUGMeoRn86QX0pbQ==
X-Received: by 2002:adf:e844:0:b0:35f:1da1:c077 with SMTP id ffacd0b85a97d-35f1da1c1b6mr2999123f8f.5.1717999035187;
        Sun, 09 Jun 2024 22:57:15 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d29e57sm10097602f8f.2.2024.06.09.22.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Jun 2024 22:57:14 -0700 (PDT)
Message-ID: <a8fa2f27-8c7e-452c-82c7-fb0a0d93b9fe@tuxon.dev>
Date: Mon, 10 Jun 2024 08:57:13 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/15] pinctrl: renesas: pinctrl-rzg2l: Acquire lock in
 rzg2l_pinctrl_pm_setup_pfc()
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240530173857.164073-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240530173857.164073-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 30.05.2024 20:38, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> To keep consistency with rzg2l_pinctrl_set_pfc_mode(), acquire the lock
> in rzg2l_pinctrl_pm_setup_pfc() during PFC setup.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S

> ---
> v2->v3
> - New patch
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index 1cbf97d416bf..2be088bbbd9f 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -2541,7 +2541,9 @@ static void rzg2l_pinctrl_pm_setup_dedicated_regs(struct rzg2l_pinctrl *pctrl, b
>  static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
>  {
>  	u32 nports = pctrl->data->n_port_pins / RZG2L_PINS_PER_PORT;
> +	unsigned long flags;
>  
> +	spin_lock_irqsave(&pctrl->lock, flags);
>  	pctrl->data->pwpr_pfc_lock_unlock(pctrl, false);
>  
>  	/* Restore port registers. */
> @@ -2586,6 +2588,7 @@ static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
>  	}
>  
>  	pctrl->data->pwpr_pfc_lock_unlock(pctrl, true);
> +	spin_unlock_irqrestore(&pctrl->lock, flags);
>  }
>  
>  static int rzg2l_pinctrl_suspend_noirq(struct device *dev)

