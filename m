Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4EF2C3B79
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Nov 2020 09:59:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbgKYI7D (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Nov 2020 03:59:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725792AbgKYI7D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Nov 2020 03:59:03 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A04CC0613D4;
        Wed, 25 Nov 2020 00:59:03 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id u18so2027696lfd.9;
        Wed, 25 Nov 2020 00:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=92bB5mZRd1+2Duzu7V5Dv1oVhr9VfQKYvZ5E5sx2G1E=;
        b=FZASEHZ7GTPKx0ThVfRWD3jPX57dOYLu97eZJoQu9BcpYoconWMUVfp5nuuYG7QEMb
         bdW6IIoXmtUYb4O7O/vq/3CQ+bfMHH04rEYZKzht/ZJ4uL3VKTObwzsYLlZNkJOyN/j+
         YiDahlCFzwWy4liOQeaHIMXCpcBCJIEGBeUayqNRG2Wj6Q1OmbUkkZyeSDXN1ptCfTFm
         ZV6dNBl6G8Ld/bez0E34Yz7NR6ULSfkbzxxc/6PnvSmuk7WojhOEu+P2dytSL6QJQQNd
         YwW/sX8FcogiCNoWCYEXSTgJitfvDWEM5Bl5WNRsjmLl8iTHmzychwKsTl79JjpwweZg
         0oEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=92bB5mZRd1+2Duzu7V5Dv1oVhr9VfQKYvZ5E5sx2G1E=;
        b=R9F94Mx9YSVYje+GZm7qNJr35b+aTCljK5jVMmErRhhUhbR2WOcEgxQk3WsqTXKly5
         mpTFQ4r4E0jIJfMsJG6vZ90UzRYH6f6TdCdCVcqo6uOt7JBwQy/nI8NbKonh1GgGcbZ0
         L6TWfR1zjjZZ6Io30nPkL8/ilbYx1+bu/p7d82iVCJy0Ab3ObWQARAp2U7vSWp+ePVzU
         PxBnFshR++szHqZDy/HXIsxCdyy/vxJ5r3paQ9qp8BoacMaX+SOH2Q7tDTFqTS+8KydX
         EZguvEwmEFR5HJQX/RP6RhJbF76MLaFLTY6BF2OIasrwgvZFUh6mwKMgosb2Pkrh6UV2
         LYag==
X-Gm-Message-State: AOAM53041cWv7fPCcHBMBBHYiSb9dtGm97SL9b2SQc0y5OL2WpNf94yh
        CPoM4iFFTlCD+LfUo64zhThkAmLseMvKcg==
X-Google-Smtp-Source: ABdhPJw/pTfa+meQnCCImW5eeJQ0gsr+RkuFcULa9xTLAFuSK/tQeBHv8GLEwAhc0pO2T7pg/Bzrxw==
X-Received: by 2002:ac2:5190:: with SMTP id u16mr952665lfi.56.1606294741749;
        Wed, 25 Nov 2020 00:59:01 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:4212:944b:4041:d4db:b733:f39e? ([2a00:1fa0:4212:944b:4041:d4db:b733:f39e])
        by smtp.gmail.com with ESMTPSA id j23sm179103lfh.88.2020.11.25.00.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2020 00:59:01 -0800 (PST)
Subject: Re: [PATCH 3/5] memory: renesas-rpc-if: Export symbols as GPL
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jiri Kosina <trivial@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
References: <20201124112552.26377-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201124112552.26377-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <99770be4-a55d-097b-7f4f-135610cd5eaa@gmail.com>
Date:   Wed, 25 Nov 2020 11:58:51 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201124112552.26377-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 24.11.2020 14:25, Lad Prabhakar wrote:

> Renesas RPC-IF driver is licensed under GPL2.0, to be in sync export the
> symbols as GPL.

    Didn't know there's a connection...

> Suggested-by: Pavel Machek <pavel@denx.de>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@gmail.com>

[...]

MBR, Sergei
