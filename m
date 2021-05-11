Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3100F379ED2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 May 2021 06:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbhEKEzc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 May 2021 00:55:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbhEKEzc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 May 2021 00:55:32 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18F1FC061574;
        Mon, 10 May 2021 21:54:25 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id x20so26733511lfu.6;
        Mon, 10 May 2021 21:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=gUde+0C3uKFPjg4eE3AOOGn4QQ9yT5Sdvd4hkNYDw4A=;
        b=LMJvsyDVQRsdlaAdXNrDQEv/MOnoCVJzTk3qzuJniXNoy7oF3OEMZNz4aOC7iPkNGO
         U3qyPxZOu0vu5QHnKI0jTgRmqthh9yC3zykpCcQHq81SE0OnUtaXZHCYydZkaBmITod+
         NmM0l4IBvbqFWEMGZ6UlYnD+iM/rZBeAmOgRspMLvW7Qep/s7r/tXO8c7kKs0hVuv6FD
         OfBXsBg4Cs/PaUIkJiGnxnsDG1CFewAqO7EyT2YxNfUBw0ns3Uhfr8dL2KeLtORdysgR
         i6zuh+QHFIDqoU7Pk4m2TVDRvUHTcbIklLT2uzx8xuILAaspv+Ofeb8q/HXNI2UKRnWR
         Tkqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gUde+0C3uKFPjg4eE3AOOGn4QQ9yT5Sdvd4hkNYDw4A=;
        b=e4ld7cTjKl5X5/hfvrRF4HwPjHNYHPI/x8GDVmRDYrqymWQaE+qUFMzFqs4vqqbQ4p
         io+u12ZQgFqH+mogdIQkyIhQJsgqV/3ESBII9RW0nO8ls/Rq/O63d0iTL/pLCVsPsVIm
         Av2zkcjq6zdIs8sMVhVhxQPkdWhkhsAKR05jA2u5ZPtw89VvEi+OHqHruTHE53m3xt3/
         1BMsoaFMm/N/CK+lkKNrYVSYmCl/aE29u33XtWqtP16YPqgDJ4uwU8cSQqg8YSz4xEfr
         2nvos3rUbb9ep+erlULNEsqP4fwvR5sLjjrRd8lbu60q02VyzquP+zt1QAHCYHP2+gAt
         xTjQ==
X-Gm-Message-State: AOAM530DlujQ73AROhV2lwpno3deKUv6p/Zt0Gh6J4p7eXaF8mlCWBTD
        mYaG4penbNWwsnjrMMPklcc=
X-Google-Smtp-Source: ABdhPJwgrRWl6DhBeWJJShgRfVrOjBrs83HkKSkcxrUmsZTJfcdtPutDR6rtLau1yNbUVAWdsAllow==
X-Received: by 2002:ac2:464f:: with SMTP id s15mr19216179lfo.329.1620708863614;
        Mon, 10 May 2021 21:54:23 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id v77sm2471474lfa.111.2021.05.10.21.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 21:54:23 -0700 (PDT)
Message-ID: <4d980efbec6a63d3241c14c7afdbaf14459d3fb3.camel@gmail.com>
Subject: Re: [PATCH v9 05/10] regulator: IRQ based event/error notification
 helpers
From:   Matti Vaittinen <mazziesaccount@gmail.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Mark Brown <broonie@kernel.org>, Kees Cook <keescook@chromium.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "agross@kernel.org" <agross@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Date:   Tue, 11 May 2021 07:54:22 +0300
In-Reply-To: <a22cf56239512f52ae5927f226e79d890d7a1240.1620645507.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1620645507.git.matti.vaittinen@fi.rohmeurope.com>
         <a22cf56239512f52ae5927f226e79d890d7a1240.1620645507.git.matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


On Mon, 2021-05-10 at 14:29 +0300, Matti Vaittinen wrote:
> Provide helper function for IC's implementing regulator notifications
> when an IRQ fires. The helper also works for IRQs which can not be
> acked.
> Helper can be set to disable the IRQ at handler and then re-enabling
> it
> on delayed work later. The helper also adds
> regulator_get_error_flags()
> errors in cache for the duration of IRQ disabling.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> 
> +static irqreturn_t regulator_notifier_isr(int irq, void *data)
> +{

//snip

> +	/*
> +	 * IRQ seems to be for us. Let's fire correct notifiers / store
> error
> +	 * flags
> +	 */
> +	for_each_set_bit(i, &rdev_map, num_rdevs) {
> +		unsigned long evt;
> +		struct regulator_err_state *stat;
> +		struct regulator_dev *rdev;
> +
> +		stat = &rid->states[i];
> +		rdev = stat->rdev;
> +
> +		for_each_set_bit(j, &stat->notifs, BITS_PER_TYPE(stat-
> >notifs)) {
> +			evt =  BIT(j);
> +			pr_dbg("Sending regulator notification EVT
> 0x%lx\r\n",
> +			       stat->notifs, evt);
> +			regulator_notifier_call_chain(rdev, evt, NULL);
> +		}

This construct sends own notification for each of the event flagged by
the driver. My thinking was that sending each event separately ensures
all of them are handled. OTOH, the comment in the even description
states:

> * NOTE: These events can be OR'ed together when passed into handler.

So... Should I actually simplify this and just punt out all the
stat->notifs in one event? That would get rid of this one extra loop.

> +		rdev_flag_err(rdev, stat->errors);
> +	}

Best Regards
	Matti Vaittinen


