Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2E2C2428
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2019 17:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731976AbfI3PWJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Sep 2019 11:22:09 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:32891 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731880AbfI3PWJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Sep 2019 11:22:09 -0400
Received: by mail-lf1-f67.google.com with SMTP id y127so7382756lfc.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Sep 2019 08:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BYhlWrHWLelqFbRdPy6ZGRcd9+nrFvoHl+u1ZjT58D8=;
        b=gaQIrHjqhtxc9Vu0s62Jnye1nv5XuyFPrgvwz5ZT1ZXmoShaHHS+ve+jA0AVghqnwb
         8E+Quo9WZOcQvUGqGU00qAX7BiRjZ9aj44L6UDB7kUECcRsg7iCZJltEnNyABPTBQnND
         uQ58Ou39o2LNLXXdR6oXgBA5e0CmRlNQGLHPU6iaEvgaw5K++Rx46pvXmjCuS12GAbVH
         Vk7rpTkB4DEX27q8LuuPvWlx4pYsRw9wUuXXd3ULIQbKCf/hmjNJ8UdH70SgkDjYyZmr
         7QoD6WLrIaQ2DC32jxvkNzfWSTZmToprV/6TE1MV1q2VMCNWOeyV8f8xMeajsOo/DR+c
         frRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=BYhlWrHWLelqFbRdPy6ZGRcd9+nrFvoHl+u1ZjT58D8=;
        b=fw8OkjvUOmvOfGB+qQCMHFYu1anAqtRP/OC2RRqpuiItmQae/IYG//fvH8ElBdboCj
         /gr4Xmw+NYUau/jNxI4ALUESwhFZ9jau4yXmGQGSIliQf0vbxA7ayeDQjOfJyCzUxE5a
         sBinV6e1VGpt86gpCHlTwWHKZ3t906zHSBblBx8aY0nwTEa782DqJ2lGNZotYb+JyNNA
         QUb3MpJ8rNfEG0cUlk3P9K34xiEr/+KBzpO3ZKhNKhYJCjiP56NYql+G5sfm7/EMPHmr
         Rcio8CrcdWGJCcZ7ghTFpmMRWhTHID/Gdvv7ShPuJJ5YtZMAzDJN34waEKdN+3VX7oQ/
         DyCw==
X-Gm-Message-State: APjAAAV9cZ7Yz2uF9HmAEkMWj7e1v53wY+rOIzcyIJRJZ6i0i3ANYUHw
        W57s7zr4sjRAe9V1l4fIg3EYWHwPNGaKBw==
X-Google-Smtp-Source: APXvYqwTWoTE5shzu61ppDaQRiiuYNekMNd0KjlXF3rFYiBM2AtqkDHLkwmmbig9GCZrzOVNCvqRQA==
X-Received: by 2002:a19:6a09:: with SMTP id u9mr11431543lfu.91.1569856925746;
        Mon, 30 Sep 2019 08:22:05 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:467d:f1c8:1ca9:8602:259:4d25])
        by smtp.gmail.com with ESMTPSA id y22sm3230030lfb.75.2019.09.30.08.22.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 08:22:05 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: sh_eth convert bindings to json-schema
To:     Simon Horman <horms+renesas@verge.net.au>,
        David Miller <davem@davemloft.net>
Cc:     Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20190930140352.12401-1-horms+renesas@verge.net.au>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <fa068941-3456-070f-33de-dc3006bb45f6@cogentembedded.com>
Date:   Mon, 30 Sep 2019 18:22:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190930140352.12401-1-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 09/30/2019 05:03 PM, Simon Horman wrote:

> Convert Renesas Electronics SH EtherMAC bindings documentation to
> json-schema.  Also name bindings documentation file according to the compat
> string being documented.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
[...]

> diff --git a/Documentation/devicetree/bindings/net/renesas,ether.yaml b/Documentation/devicetree/bindings/net/renesas,ether.yaml
> new file mode 100644
> index 000000000000..7f84df9790e2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/renesas,ether.yaml
> @@ -0,0 +1,114 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/renesas,ether.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas Electronics SH EtherMAC
> +
> +allOf:
> +  - $ref: ethernet-controller.yaml#
> +
> +maintainers:
> +  - Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

   I'm not sure I can maintain a YAML document as I don't know YAML. :-|

[...]
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 296de2b51c83..496e8f156925 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13810,7 +13810,7 @@ R:	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>  L:	netdev@vger.kernel.org
>  L:	linux-renesas-soc@vger.kernel.org
>  F:	Documentation/devicetree/bindings/net/renesas,*.txt
> -F:	Documentation/devicetree/bindings/net/sh_eth.txt
> +F:	Documentation/devicetree/bindings/net/renesas,*.yaml
>  F:	drivers/net/ethernet/renesas/
>  F:	include/linux/sh_eth.h

   Are you planning the same thing for the EtherAVB bindings? We need to rename
them to "renesas,etheravb" as the current name is neither here, nor there. Tha was
my fault... :-(

MBR, Sergei
