Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D3ED1DA240
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2020 22:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbgESULS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 May 2020 16:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726348AbgESULS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 May 2020 16:11:18 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABC96C08C5C0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2020 13:11:17 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id h188so613946lfd.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2020 13:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=umDGCMjOzElaHcpXS1mIHtTsMYu/2vBzFt+CUEWjizA=;
        b=HMbrlcloN+IuF8m+X22/z5Qp6yEcJ6/5ojLAwp7K0cxSo6/q1KXb8GQhLT/fTN9WqK
         cdjZ37TPgRBERLVXsLji5ZEugG3SrJhBD+ajhb6d84SS+b2xVIe1c1l/Y47Od+xX3ZCV
         k04E6b4g7tm/XYCJ1L89uz5jVRKoqxy2rrcQUYRkjS2s6yJbD5dIqQsutNaTJufpd4IV
         inhzhujqS0ux5QPLhDvJkp7CmLOQVuCFm1ckXtN22p0Me15k4iTJbJGoClZF5oxb3pza
         NM6tOflb0adiD7r63zyrihEawpLZs12cDm03+U+mpjtpZg1Kh/TxnnTx1P6nM+YOlHNp
         MdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=umDGCMjOzElaHcpXS1mIHtTsMYu/2vBzFt+CUEWjizA=;
        b=pqAUErkGjqC27ELxLmBlxfJj2wQsNPWZxS1y+x6zsYedw+5y7sEDcoGC79yFQbRpnv
         Dkrc7+EQpN01Fv30m18LNg0ygd5vhPdI+FzBwUOwQJgjVskOaB2EceFh4J1PA+0g3WJX
         nUeFnXoOKqQADxwfYIAQ9O5/k1brG7Ej3pImw2ofzBySQG35DE13YM5HMEOvULmG9L4r
         m6eZ03nUOjBAhYeoZlkh7/lO21Hyl0P2RLXdGTVB2wpnkeCxKzPCPn2VbrmXd/X5ZAOm
         gmAg7CWkg2xw3gdK21MqtgprFmh9+Om+TBx9BtZkTE3Y3/IrVJsKBOIKKsaZ46hZKncF
         k5vQ==
X-Gm-Message-State: AOAM5330YLhzdBTVe7NexkXbkwNMmPnZ4TuU0Jc4GeesTRmvEEF6/6HU
        9WiECgJ9v6pvk44+xIgvX3xnnw==
X-Google-Smtp-Source: ABdhPJwClBrtZuLBQYeiUWl5zmIoujH3skYcSgxUFemsMJBlDjLeUwEdruZ3ob5BPq4JnK4QESXa8g==
X-Received: by 2002:ac2:599e:: with SMTP id w30mr362994lfn.188.1589919076162;
        Tue, 19 May 2020 13:11:16 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:2c3:baf8:452e:b00:c0e9:c252])
        by smtp.gmail.com with ESMTPSA id t20sm223975lfl.17.2020.05.19.13.11.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 May 2020 13:11:15 -0700 (PDT)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/2] Add R8A77980 RPC-IF support
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
Organization: Cogent Embedded
Message-ID: <850d4a7b-4984-eb0f-de89-e5c39d61d19e@cogentembedded.com>
Date:   Tue, 19 May 2020 23:11:14 +0300
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
'renesas-devel-2020-06-18-v5.7-rc6' tag. I'm adding the RPC-IF device node
for R8A77980 (based on the RPC-IF driver) and describing the QSPI flashes
connected to RPC-IF on the Condor and V3H Starter Kit boards.

I've removed the R8A77970 parts in this version as the RPC-IF driver support
for that SoC isn't complete yet.

[1/2] arm64: dts: renesas: r8a77980: add RPC-IF support
[2/2] arm64: dts: renesas: r8a77980: condor/v3hsk: add QSPI flash support

WBR, Sergei
