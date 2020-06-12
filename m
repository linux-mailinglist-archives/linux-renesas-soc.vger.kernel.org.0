Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 457BE1F789B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2020 15:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgFLNP2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Jun 2020 09:15:28 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:32789 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbgFLNP2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jun 2020 09:15:28 -0400
Received: by mail-ed1-f68.google.com with SMTP id o26so6393718edq.0;
        Fri, 12 Jun 2020 06:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4D2rMsygZsdGfX84JAU3QPYEGsf4eDb0utLXSNRnqdE=;
        b=WxjHSjzdwBrHgXMxdaUZMwN131dq3WxMAzrALq8I94VdZ2Lhe4XIHidxBeukJEaDBJ
         UUQkDafcxMrq+zretoyJS7uWwMLXZF2/CmtbjQpgewwzvvc/j1Cgu+vQh4bjfmZxDBuV
         RmJlEEWaSfK08e17PtXBhD+HL0En/EcY9Thc4MTCV2/gqecoAyjGnSzMqbOc1khQbm1U
         PODbt9m5vH8U6TmDjfuDmNhN3k9yknzpWpc9kf32mO9eWlyWzNtDhhSdQl0Dl3ky55bb
         kHv0VS0s//eMQhcjTwaNPEJmfIP/O6TW5GIzgkVzkf6+PNTmKymNWpmoDhxvHnnGC4Z9
         VaPA==
X-Gm-Message-State: AOAM531h/lDyZ+bFqpR6v5BrfPFxChwSQ4iI9FTVUiToB9qxY2phmQ/r
        xJfN3578FaI57BLQvrJEIkAa2J3X
X-Google-Smtp-Source: ABdhPJxZAN+MpAUgvjVkAQg1d9EuGxVZtBwP08eklGQ0IeLSZabnx/BuqQc34BEID84/FRflGJdQIQ==
X-Received: by 2002:a05:6402:3078:: with SMTP id bs24mr11524415edb.284.1591967725620;
        Fri, 12 Jun 2020 06:15:25 -0700 (PDT)
Received: from pi3 ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id bm9sm3068676edb.84.2020.06.12.06.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 06:15:24 -0700 (PDT)
Date:   Fri, 12 Jun 2020 15:15:23 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] lib: update DEBUG_SHIRQ docs to match reality
Message-ID: <20200612131523.GB26279@pi3>
References: <20200612124844.19422-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200612124844.19422-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 12, 2020 at 02:48:44PM +0200, Wolfram Sang wrote:
> There is no extra interrupt when registering a shared interrupt handler
> since 2011. Update the Kconfig text to make it clear and to avoid wrong
> assumptions when debugging issues found by it.
> 
> Fixes: 6d83f94db95c ("genirq: Disable the SHIRQ_DEBUG call in request_threaded_irq for now")
> Link: https://lore.kernel.org/linux-i2c/859e8211-2c56-8dd5-d6fb-33e4358e4128@pengutronix.de/T/#mf24d7070d7e0c8f17b6be6ceb51df94b7d7613b3
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

