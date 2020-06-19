Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B687201C46
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2020 22:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391915AbgFSUU0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Jun 2020 16:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391932AbgFSUUZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jun 2020 16:20:25 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AA6BC0613EE
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2020 13:20:23 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id n23so12913878ljh.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2020 13:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=E7L9r0z3/t6FzQeUpWNZ1H0U1n9mxr0xJxprU/23UXA=;
        b=R/Z5ulzLOEi4Zu98oH9KytyUWyT0BLLPsu82Xx1VGBwKKHVvsVWE8eN3tYi4dpDJUH
         v2PqoCJBmR9q3ghNgQGWlOzWLttFwuyLjMio1ugoptNHAlXWkqR+kUKAmAzzgv4BIcQE
         V8bcO4aN6I+Ov3Boh8Lp8OFLo0rc7rUYK53S9RFgrVqYrTeZUnWIaGjbnsQfNYTt5O7S
         S5/+E9yuXeL/PuzQFXHS5exqZs9+I1rY/Wxp5r1g5AkQuEZBZZaJ+np8sU/LVRPKW4d7
         9y72XLlpQTvyBJef7mBoaf46RzCOJ8ZWFQUeEFmo8mf8L+CfskZVJ6dvREukt3lJidci
         0kGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=E7L9r0z3/t6FzQeUpWNZ1H0U1n9mxr0xJxprU/23UXA=;
        b=G2Refx3FBUYwDJhJnVzPAIkwsfzrBqP+Z1+/twRYR2e7Ob3uNaiiUR9hPHulhuq2v8
         SKH2dRL3f5LJZTginysArmd+YjOuEOe0tu8o10PVqm4x+whnTsO7JucT/t5dHRylgZqz
         HKc9qN1wZkP46IsjXQdlULUQ1d6yMKy0pDQQoUFwaXl9EsR3POx8lS7th9W8ar4SIB3t
         mPfaTcQqvvMd8/MT32vyXC7CuI0WwNTcU1aNc0FUCOZbItvdQE5JT89HMdsAB/kI5AWd
         3CHLu3yZW+PtyhIC/OGS9ifz8/yKxStTwDa9G2N9LjiGsW4aenagPhLjqFleYSN9dj76
         RvoA==
X-Gm-Message-State: AOAM531C15LrBy3XkQtujlyhSVgFg/D5CHX8o5BIhccfCLG9jFC86NTn
        wUlAifA+eUqKVl0ciJUO61kOpQ==
X-Google-Smtp-Source: ABdhPJy9WBcdq8Qh7iQJJdk5T+VHTJmTWSXfO00qnlKV96pTDYj7e/D/mGxz/LSoxOtW4KOj1sqrZg==
X-Received: by 2002:a2e:9bc6:: with SMTP id w6mr2821858ljj.429.1592598021989;
        Fri, 19 Jun 2020 13:20:21 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:441c:ac8f:7564:6e7d:9e36:7ded])
        by smtp.gmail.com with ESMTPSA id t16sm1318040ljj.57.2020.06.19.13.20.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Jun 2020 13:20:21 -0700 (PDT)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/2] Add R8A77970 RPC-IF support
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
Organization: Cogent Embedded
Message-ID: <13425133-eedf-081f-4ed7-cd9012ce7d6d@cogentembedded.com>
Date:   Fri, 19 Jun 2020 23:20:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

Here's the set of 2 patches against Geert's 'renesas-devel.git' repo's
'renesas-devel-2020-06-15-v5.8-rc1' tag. I'm adding the RPC-IF device node
for R8A77970 (based on the RPC-IF driver) and describing the QSPI flashes
connected to RPC-IF on the Eagle and V3M Starter Kit boards. Feel free to
merge the 1st patch back to the R8A77980 patch from which the former one
was split.

[1/2] arm64: dts: renesas: r8a77970: add RPC-IF support
[2/2] arm64: dts: renesas: r8a77980: eagle/v3msk: add QSPI flash support

WBR, Sergei
