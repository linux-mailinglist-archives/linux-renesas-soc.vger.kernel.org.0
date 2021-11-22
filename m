Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE13458BDC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Nov 2021 10:55:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239229AbhKVJ6O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Nov 2021 04:58:14 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:47804
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239246AbhKVJ6M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 04:58:12 -0500
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CAC8940021
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Nov 2021 09:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637574904;
        bh=fs5E2FG2KHZuy/jnILr8Z75A9OX4E3rCWqYR1/W3gLs=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=nf5xnvLYBTloGbm/edVH8j+nGRRxtOfpnm0GlW/1LTRL1Hxam6NaN1wbWZ/acQAvv
         WqDe34ClBMnW33OaWEGMIHKArUF/o9uPl/6pGEybu2c0wofa6mWWvu7NBOrr16Z+V1
         ApKhJY3bmN8ZWvWpXca7VfCeuwhiUZ/nIUQmT7uhNIywZWF7OXumc7aqpna7Z+o5LO
         Oer/GRs/KThN5ujqrZf0/UNzIBU5GQrvkGw0oD9C/kI1qmOKU9QFNIofiGWJd4Iwft
         YKfQyX4YGIkxpH155aLFlBWP+SkWY1EdV4pprUqcBefC/EHsrbAVKSqiiNmk7eL5NM
         6AUCUNsL1HN+g==
Received: by mail-lf1-f71.google.com with SMTP id k32-20020a0565123da000b0041643c6a467so1138628lfv.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Nov 2021 01:55:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fs5E2FG2KHZuy/jnILr8Z75A9OX4E3rCWqYR1/W3gLs=;
        b=yNROKubi8HiWC3Rabsa/LT0l2Y/K5tfSvbIXB6S5/82SW9bt68Edkv5JmWWjnh/iXt
         0rmxd/BZxY8nghfSdK8vO9movOW3OMdLPKYwuK+JWiYFyLpYmNG5vxTgj0bUjMPd0RNY
         GPVbwMac3LXpYto5V1hLLI7i7vn8EgpuqqgL7TT1FaW9wntn2XPOEeyZ6qZJWrAfK7dI
         00EK3cylq2RRc/FhGmYlnuh3E/oyhZSQMDyjJnUQeXloME09y9m+IPS2F15TWUvbH+pg
         rCS0DD2kxz35XzkYqDdfNdPFhhU1ackhOMJRj1xo5AGKy5x4tSsbI/uqZwA0zKOZYCeN
         lqJQ==
X-Gm-Message-State: AOAM532OI3Mtk1vdnAhsUyQDvBGyQCH2C30cCXHPojoff3mDkYamoM5A
        4SK/f4arpAdIDOXHs+XebmI1VhFHQkBFo3QqREoRKmswxidAtIxCJBBNGZa3A9Fyj+V+XrK9rHC
        s2EpVECUxUKB33IA2SCVV87/2P2bGR3iJF8GFyUEjNXbXubMW
X-Received: by 2002:a05:6512:39c1:: with SMTP id k1mr55423472lfu.673.1637574903975;
        Mon, 22 Nov 2021 01:55:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKegfOMZYPJTvMiaHhh7Wg7XnbjMxgUhdR0EiKSXfjtZYJ1WUEdhXV0/tIdUFcXOg82hsMyA==
X-Received: by 2002:a05:6512:39c1:: with SMTP id k1mr55423455lfu.673.1637574903789;
        Mon, 22 Nov 2021 01:55:03 -0800 (PST)
Received: from localhost.localdomain (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id u22sm908676lff.118.2021.11.22.01.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 01:55:03 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] memory: renesas-rpc-if: avoid use of undocumented bits
Date:   Mon, 22 Nov 2021 10:54:23 +0100
Message-Id: <163757486271.327364.12463737786171898002.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211117093710.14430-1-wsa+renesas@sang-engineering.com>
References: <20211117093710.14430-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 17 Nov 2021 10:37:10 +0100, Wolfram Sang wrote:
> Instead of writing fixed values with undocumented bits which happen to
> be set on some SoCs, better switch to read-modify-write operations
> changing only bits which are documented. This is way more future-proof
> as we don't know yet how these bits may be on upcoming SoCs.
> 
> 

Applied, thanks!

[1/1] memory: renesas-rpc-if: avoid use of undocumented bits
      commit: 57ea9daad51f7707f61a602a743decf10cf9fea9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
