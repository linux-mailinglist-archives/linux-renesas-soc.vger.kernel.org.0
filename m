Return-Path: <linux-renesas-soc+bounces-1326-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 022A3825154
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 10:58:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B718AB219D7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 09:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BBA524B2A;
	Fri,  5 Jan 2024 09:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="aeBX0fml"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3514C24A16
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jan 2024 09:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3374c693f92so1005167f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jan 2024 01:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1704448710; x=1705053510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OiN3TPuhyBrv7j37UKptDKPBW0Pi8aCzPO8pse8xtfU=;
        b=aeBX0fml4PCa5E/uM9gNE4hZYElG6dWhfwWCxCn4tT721qot01lX04YHnYXfzOzXwi
         2TUCyx1gHw8rwgtT26XtggV+620RTpAe+J+HfqfloUEPUJWTjwrwpDOrYCUgc+LiEx+Y
         OAVWleqVLPp+7SRjFwKAgv6nWb8PYjLpBNUDKff8iBUl+F4KaPtFySVDxK/eyMtGr77M
         gS8yyaAXdgMaWYMgUbk9cpnR/fF0XSS/UKmT04wl5N7wgEwa4FL3XSEA2NbsC1EAvA/0
         a6PDEkPNwvR0Sjfbho+7JAcanUxIYxIB3s2yvjz3zQxIBRy89epwKPXvLb9gUkdEifIC
         Jefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704448710; x=1705053510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OiN3TPuhyBrv7j37UKptDKPBW0Pi8aCzPO8pse8xtfU=;
        b=TfGzK6sHBA7M7bDpdqIIEhJ5rBJY0s7oYjHuGJTqurmmKUt6AoiwuY1DG++rwZVJWi
         X5kEGRAZTG93gGLQ3M4tLlAHpb8Yu0sq/WfpWSL1sgEG0tw5/dER0bNbA7uTfuZUutNa
         v/SQCQYEox/7gGqyiYUMaxAnKXDlKRESg+7Apq4WYMTHPFsgBBF9ZpOHE324Cs9QQWu2
         yzojwdb6eciWJmZo7hZl2focuBMGhA/pFQsRXpJ7E3/OqaRR9wUuKTG3aKgJ3hoa8xSd
         Neonmm0UHrTpHDJdy8vNwE4+ldAvujj/vkCLwJlhSvQWZi5F1zzoVtVyPfhdBCkqI1Hu
         uQYQ==
X-Gm-Message-State: AOJu0YzeKd1M5IH/c6bMO1+5h5p1L7ZboF3spLaGvrbzpdEHEK1C5Tpp
	Z6slBv8YqJ/3I7PsjpF7oV5OX7heXlWgdw==
X-Google-Smtp-Source: AGHT+IHCKz0QgH4x9ErxisQfTQBTzESEcMiWbolukF4NZfuxPNfjgTiMcpHPek4LQdms67Qpjzv34Q==
X-Received: by 2002:a5d:65c7:0:b0:336:7449:2da4 with SMTP id e7-20020a5d65c7000000b0033674492da4mr1016729wrw.95.1704448710436;
        Fri, 05 Jan 2024 01:58:30 -0800 (PST)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id w1-20020a5d5441000000b0033674734a58sm1077540wrv.79.2024.01.05.01.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 01:58:29 -0800 (PST)
Date: Fri, 5 Jan 2024 10:58:28 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com,
	p.zabel@pengutronix.de, yoshihiro.shimoda.uh@renesas.com,
	wsa+renesas@sang-engineering.com, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	geert+renesas@glider.be,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH net-next v3 00/19] net: ravb: Add suspend to RAM and
 runtime PM support for RZ/G3S
Message-ID: <ZZfSxLblUpW2jCyu@nanopsycho>
References: <20240105082339.1468817-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240105082339.1468817-1-claudiu.beznea.uj@bp.renesas.com>

Fri, Jan 05, 2024 at 09:23:20AM CET, claudiu.beznea@tuxon.dev wrote:
>From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

https://www.kernel.org/doc/html/v6.6/process/maintainer-netdev.html#netdev
"don't post large series (> 15 patches), break them up"

