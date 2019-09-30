Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AABC0C242F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2019 17:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731957AbfI3PXm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Sep 2019 11:23:42 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33062 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731276AbfI3PXm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Sep 2019 11:23:42 -0400
Received: by mail-lf1-f65.google.com with SMTP id y127so7387118lfc.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Sep 2019 08:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PFWrtL6kjCWIw5AHUQmvARULYmo2lqWhXo2uuDZVytI=;
        b=SpREBLtM36QAoEA7VOGF248QCPo4E/VAJS54VgF/pLnZDLtwzi8dETiaHR57OBrBt5
         W4D9m4DWhlrfxDGQPy0QJtgHCFF4SxvVKLZskWV9SUK3Zeb2HnSSSzMH8KSRhz5fJWHy
         uhWRo8Yyo4bztdHTaaa9VjJvz2R9nhmjSRQcycjnzPeI+QQOdWfPm56c+3dsB9FnExMV
         4t81jQppwmubwur/4v7gJDoHQ8RdKpISY0Ia1NbpVXFra+FipWNWZxPVyoJs065mL9Oy
         iSbnh9MDP6vUaxpMsP0UkIgkhr2+x3BEbS5E5082lEwNm4IHlJftK6Vx995f3ZtdnoZn
         HU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=PFWrtL6kjCWIw5AHUQmvARULYmo2lqWhXo2uuDZVytI=;
        b=QHw2q2EPa0/Eewdnr9paVU8BM7Ce2THe4dkzf6ZgHB2pWNR25tvEhR96P2Ojn6L7KF
         XT94J27cCXV1HebRQX+Ijg/bKEFAPwd8ecSWMQwVakklYj7iBW04UCg+eUlLciUVP0d4
         njlFse2QTDb3mQmj90r6/scXolmwXZqvOjSJN6+DzsUYkHK0x/gbGW0w/botGAh+lA0I
         m1EJPZDjJ1rW23LECX7fkLI97xzoB6olsM8yPgRNY28PUCgwdK+dWaTknrpkQUgaUZfy
         TCppgDbpzNEmFpwsywJMgwAmnMaEUVwEWdx5cvR1z3yk8MMSBw47nVkmREbWePJTBWQ9
         OuvQ==
X-Gm-Message-State: APjAAAUEiTc3S52rNz+Y+pT2My6DZG15LlObNRarLMrBMC7Q1GFEYKzV
        8Js0jI9qtqfT4xjgSJqxRcB6Wa0wU4DIrA==
X-Google-Smtp-Source: APXvYqx9Feb0gelX6GjlJ8/WQ9ni5jx48p3Alw9QAQbpYTOCk2Hl3y703v1a9l9XEYrYyO+jnUxkmA==
X-Received: by 2002:a19:ec16:: with SMTP id b22mr12110048lfa.189.1569857020119;
        Mon, 30 Sep 2019 08:23:40 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:467d:f1c8:1ca9:8602:259:4d25])
        by smtp.gmail.com with ESMTPSA id r22sm3284667ljr.43.2019.09.30.08.23.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 08:23:39 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: sh_eth convert bindings to json-schema
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     Simon Horman <horms+renesas@verge.net.au>,
        David Miller <davem@davemloft.net>
Cc:     Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20190930140352.12401-1-horms+renesas@verge.net.au>
 <fa068941-3456-070f-33de-dc3006bb45f6@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <200d8899-2fe7-44be-8945-897667e146ef@cogentembedded.com>
Date:   Mon, 30 Sep 2019 18:23:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <fa068941-3456-070f-33de-dc3006bb45f6@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 09/30/2019 06:22 PM, Sergei Shtylyov wrote:

>> Convert Renesas Electronics SH EtherMAC bindings documentation to
>> json-schema.  Also name bindings documentation file according to the compat
>> string being documented.
>>
>> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

   And of course I forgot the tag, here's it:

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

[...]

MBR, Sergei
