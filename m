Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA57AA5BF6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Sep 2019 19:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbfIBRyH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Sep 2019 13:54:07 -0400
Received: from mail-lj1-f171.google.com ([209.85.208.171]:37701 "EHLO
        mail-lj1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbfIBRyH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Sep 2019 13:54:07 -0400
Received: by mail-lj1-f171.google.com with SMTP id t14so13615239lji.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Sep 2019 10:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vx4HaqK6AE1z6LgryEVwhVJxZoS5P56Z5PixfIIvqCU=;
        b=aGvSePxHgUIq4RRBmtGloVUytzJDaUApsvvS8wzuNLHp1FutXRz9a8s/vxDbcHLQfI
         duRlSpjdFux4HkIPS5LlMxLMfv+oyr7OJczjBRNTIzoHsyz9RNxWlcnchV2La05Jg3XO
         g0YLv1hHNXX1ZDJr0K27w0VNJ5cL2t6TpgXN7AQC5gm7pyJnw+vVcd/Ae4r1I6lfms/w
         0NFL01ppc0ORKkNytFjPkf32MO9tvuLOEyjHuz7Sfp9X4BjMPLjSOIT/a9gL5NceAOuC
         XgqeVI2tupMoBffNsMx7par+iuk++ZymHk5bsmNeNPuJfdkUrLA9pVVoLOn4wCeItoJ2
         FNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=vx4HaqK6AE1z6LgryEVwhVJxZoS5P56Z5PixfIIvqCU=;
        b=a/X1GxVJR1q+TCfymDi4oFpIAvwifpzg+7XSeB8SNsqroYHBKwN50gshWZDjR/7ViS
         XNTu3Sc1k/XGeWwWv1DfHejD3nYSFnaVUrvf0ZBbtfdIgBKoenLq6+Uj5Dx5qqu+cnJX
         NR9LtdKsgoISOHoF+2NjhkzOJuGb+QC964VmAw3b3Bi8qQMMhjEPus9L8Uga6d5F3x2p
         rtc9CkvGJ94KEF0pk4a/flQ8rOgqQPsz13+y0HExlZHhEiWCHkqaArpWD5REOyQN0THL
         ATZUwvLNfYGtpc7BkXuNMkhWGyoIz+RkXq9lq4xsKHbAH5qe7/EAg+NrfpdwXvL/Symb
         fJhQ==
X-Gm-Message-State: APjAAAWxPGj4FLS/DsSzzlQFXuTsx3lEZhCTQdmEDHv1oQnektduLNwf
        b/8Sgb4rqcSXvKI+AhD4cZCe0fj7PfY=
X-Google-Smtp-Source: APXvYqzC7ogYgiubFvtvgCNUw75+FdS8toV/0HR5eOMyyv0G/FyTSo1BOJj9Sufy62Bebq89rccAvw==
X-Received: by 2002:a2e:7613:: with SMTP id r19mr5108148ljc.216.1567446845504;
        Mon, 02 Sep 2019 10:54:05 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:272:5afe:be7d:d15f:cff2:c9cf])
        by smtp.gmail.com with ESMTPSA id v7sm32528lfd.55.2019.09.02.10.54.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 10:54:04 -0700 (PDT)
Subject: Re: [net-next 3/3] ravb: TROCR register is only present on R-Car Gen3
To:     Simon Horman <horms+renesas@verge.net.au>,
        David Miller <davem@davemloft.net>
Cc:     Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20190902080603.5636-1-horms+renesas@verge.net.au>
 <20190902080603.5636-4-horms+renesas@verge.net.au>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <92f5fa81-39c9-4d98-539b-bb6ea7374472@cogentembedded.com>
Date:   Mon, 2 Sep 2019 20:54:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190902080603.5636-4-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 09/02/2019 11:06 AM, Simon Horman wrote:

> Only use the TROCR register on R-Car Gen3.
> It is not present on other SoCs.
> 
> Offsets used for the undocumented registers are also considered reserved
> and should not be written to.
> 
> After some internal investigation with Renesas it remains unclear why this
> driver accesses these fields on R-Car Gen2 but regardless of what the
> historical reasons are the current code is considered incorrect.

  Most probably copy&paste from sh_eth.c...

> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
[...]

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
