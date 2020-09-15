Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13F3926A09E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Sep 2020 10:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgIOIWu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Sep 2020 04:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726355AbgIOISv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 04:18:51 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1A8FC06174A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2020 01:18:49 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id y17so2142841lfa.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2020 01:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jspnCSJZ4whK6pw64H48mHTUpMRPufPNxBh+u8GrYgk=;
        b=mgqNvmPKH7ClICzTYAi1FFE8jbt8e+UeAa3ntJw8YhnPapVRvqvnCKgNk8SzK2lmWz
         opbGSOEP5TrFnDCtFPvnSnm5miFB64TjEiyXWu/xC7UrYj0w0/OXa2SaTdmRHEIy+nkD
         I2sDz3d8t9MbCnCve4+zpjiK2dxJ7MWG2JKTqNJGlH6Sj7trK2Oi8lfKT5ZlYa3qtlOw
         eG16B2gaMV75+u6Rl+mDLoxGzzKtgdO4UnwQnfxR1hZOXoD8rkZ0jbtZALueXa6sH6O3
         95gZNGV8JKpCuIcyxY8l0dbPb27nJE6YjPFdpi8wRqOHKi4h0rXHKwdUX0a/DcBQ+L2y
         bSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=jspnCSJZ4whK6pw64H48mHTUpMRPufPNxBh+u8GrYgk=;
        b=gtReaewueL7XyDWbH7EZ64TTkC4l+PlWMu0kQjQ9OTIqxGRhNTnQlir0ze5uO9IWq5
         FOialIj2jxIkcjpkDf6eSM8LfWfNIBGrWjMW8PD2Dl9YKCSiy8S2uUNeEospskEHSzFZ
         WQ+uocRWnwU5Xfj1P0a1QinDNKasuJVFXrDXUP6goKzmDTCOlFZPHgjnCCKlrHDO+eyi
         TOWSi+HGkWml8zsax4erNUdx9ffrYWpueFvgG94QclX6MZ2dqNMC4ECL+L21xh3UBYp2
         WTxvizF4KD+XJAab7Z041n+4cS/mVqo8HBHjn6jGy+l8ip5Lx+nvUqLahZdrOzsrmyU1
         88ww==
X-Gm-Message-State: AOAM530MFn5CTZ453kPKA88l80qBThtv9uRjmQ6oWC2Zl5YurbNbTfK9
        ZLznYDVY+/BOPoTvKuuv83ef3nY93iOZaQ==
X-Google-Smtp-Source: ABdhPJycwqXanFieUwXhF/run74gWKNF3EGBlKkhTqP4qtmlZRVryOqDebdYrxtIIQlNGOzncjUZMg==
X-Received: by 2002:ac2:4c01:: with SMTP id t1mr5904643lfq.351.1600157928227;
        Tue, 15 Sep 2020 01:18:48 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4246:524b:f990:5ce8:4590:941a? ([2a00:1fa0:4246:524b:f990:5ce8:4590:941a])
        by smtp.gmail.com with ESMTPSA id g15sm4561739ljj.39.2020.09.15.01.18.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2020 01:18:47 -0700 (PDT)
Subject: Re: [PATCH 4/4] pinctrl: sh-pfc: r8a77965: Add VIN stf8 pins
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org
References: <20200914233744.468175-1-niklas.soderlund+renesas@ragnatech.se>
 <20200914233744.468175-5-niklas.soderlund+renesas@ragnatech.se>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <e38a41d9-d765-da0a-ec03-60432dece9e0@gmail.com>
Date:   Tue, 15 Sep 2020 11:18:43 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200914233744.468175-5-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 15.09.2020 2:37, Niklas Söderlund wrote:

> This patch adds VIN{4,5} sft8 pins to the R8A77965 SoC.

    Same question here. And what is SFT8 anyway? :-)

> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

MBR, Sergei
