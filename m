Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC6A481671
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Dec 2021 20:52:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbhL2TwX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Dec 2021 14:52:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231338AbhL2TwX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Dec 2021 14:52:23 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89007C061574
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Dec 2021 11:52:21 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id s4so19328968ljd.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Dec 2021 11:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=a3SRF39H5MwTXqmknWWzU+9vuFesV2sZ6mOHxy+XADs=;
        b=0OhXb+y6CN9RnOqvYW/247vFL7aWTHlQbuXpk9mezcYk1sa745DO66mejzgNl8COdZ
         TWZ2Wfnb3RllSAdbPLin0FIIbjqeSwHhBxoGXx+osIbPg0j8dFtOEHsrYS/xAgbUYVKL
         SLO0BTeOnZmJIuyaw11F+QRrMsimcQXKeaYw5svYADgi2njlTAIiVVh0N7ozjUGCLQb+
         F05s4O9/iwSfLWCdGRogRBNcsKFaxNDBR7L3CC/rUoqSkQNhgajdstA7qkO70iic0UTV
         HZLTIfYaLPOJzeLPk6yiUuO+Pm8oOLFcZ5HDQzXRJLv0ev5BEZ2FNdWe6+QWpzFwpiZV
         RWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=a3SRF39H5MwTXqmknWWzU+9vuFesV2sZ6mOHxy+XADs=;
        b=IosqqhnIOYqqpqwBXLXhh+SZlX0AegJX2a7AB45L4e0/CJx7zbtyvLqNsZ1VhXRVro
         0EWqb8GREgXkw8xpx1SGDfPGmJ+4J1B8jAIos8+oNW8qYqMp83lNes8rYbroROZbNqPw
         /xbU0MNvcuVYg+Qtggaw8/kR934QMW5Yn6MJQDYXh4MXLfGdvWjQaS+sKZOccPqyu5Rr
         0v3dehG8F2smkKoq3QidPeSL+TKb0iGlXpHqojuupXMLTBRUopAb9RQ6v54nPh1+v/1T
         sszjWnubTlZZKsU2xRmZ1IFdKejj6iNUcbDUz0EaqwsSN+QcWXYQJmsBvh2tGWqSklAC
         hb7g==
X-Gm-Message-State: AOAM531Yz0CLu8elLxHuPd9fdqNvDNfrZvgLQZTfNW8CsPDqglA+OXEM
        zX8UhaEOTi3fiMK2h8nFfpsCmQ==
X-Google-Smtp-Source: ABdhPJyYXf+qHzIgxbewiX70QP7kuzmf7qE3RrOeaTFsXPeNJaekUrXluPlnthXsIV1FYEES/mEBaA==
X-Received: by 2002:a2e:9ccc:: with SMTP id g12mr4482335ljj.34.1640807539854;
        Wed, 29 Dec 2021 11:52:19 -0800 (PST)
Received: from [192.168.112.17] (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id u1sm320758lfs.106.2021.12.29.11.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Dec 2021 11:52:19 -0800 (PST)
Subject: Re: [PATCH/RFC] drivers/irqchip: add irq-inverter
To:     Marc Zyngier <maz@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211228165642.2514766-1-nikita.yoush@cogentembedded.com>
 <87h7aszj70.wl-maz@kernel.org>
 <b5e0ff57-885a-051b-4c4c-a02b005fa1f1@cogentembedded.com>
 <87fsqbznc2.wl-maz@kernel.org>
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Message-ID: <37db485e-b832-9ff1-4d21-606eeeba871c@cogentembedded.com>
Date:   Wed, 29 Dec 2021 22:52:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <87fsqbznc2.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi

>>> The right way to do it is to use the existing API by exposing the
>>> inverter (there are existing examples in the tree, using the
>>> hierarchical model)...
 >
> A much simpler version can be written in a few minutes, see below...

Can something like that be used if the parent domain is not hierarchical (i.e. does not provide alloc(), 
but provides map() instead)?

In particular, gpio-rcar currently provides irq domain that is not hierarchical.
As well as quite a few other gpiochips.

Nikita
