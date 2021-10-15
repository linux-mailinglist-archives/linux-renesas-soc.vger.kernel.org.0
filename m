Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00D1742E82D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Oct 2021 06:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235318AbhJOFBJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Oct 2021 01:01:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbhJOFBJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 01:01:09 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E7C9C061570
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Oct 2021 21:59:03 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id pf6-20020a17090b1d8600b0019fa884ab85so8509204pjb.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Oct 2021 21:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=i/3QbHKo5LdSeJ64rNvIXTDkZ0a1y/yiluU8ts6nvco=;
        b=mUD77OTJgAbd48V1BJNg4ix+/LYvYd2qZDzcU3fUbxZ1lkGBwFyLxb5pBKneny0nqK
         3tyA1lwXklg/3TedPJAiK0vCd6Abn+G0RkvGyZNhHYD3TIsKNzlu4fZzLuLAktmrWow8
         M0IvOQsZRYL4+3/2jw73dxE+3W/yity/MzrWwR8wwXNPZgHfmYUbDciAMrtPseVKDpjP
         bT2b64WMwOC8Fsygzn7IY4nu5enzc+edl71KtL5l7RQHwNYdJ4UtH6kL30Wt9hSZ2i9h
         RjNAXvphCHq5htf054FMcI2q4DlHWBiOjl8kqEg4P7uw/ClWRVNcOQNb97MzHWUfEAQ2
         IYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=i/3QbHKo5LdSeJ64rNvIXTDkZ0a1y/yiluU8ts6nvco=;
        b=V7GJtfcnZKMHITGu1G+HUqdbeVvXt0ePC2kODoz9xCipXoF3ntv8WjDInpAhlUfhLk
         29o8POL54xigTH0OV62zrV8ydHD/jEZyVdmrdcqyay8WBRYg62meJOoOFDYFy4PX3Tbt
         WLIGRy0W2ZFOb2+SwXIkrlBTk8XkAJVugObetwlp52K16YPQjBV87fK4MzLoCHsvPlED
         8rF3B0qmOXCf3o1pj3UN6qvqFDV206d+tnpAtGwYv7wZohpcYgg/X3GDM0FhxPY51YAu
         J5HsCJn+SgIQKvYgbcnyTZQy9yhfSWInLAG3crBuMIuVkKlfIMXt7rHhKxsLcXg/+88D
         LTuA==
X-Gm-Message-State: AOAM533mCCTye5h5DhRgnRXIhI7hbgkaR48DzDHBQj1qcQ3Ko0D5jgxv
        f6uNovfSvbzYn4uuRmhozz+BG4ReExWbHRcD
X-Google-Smtp-Source: ABdhPJx+7keUgiN+F749Q7Qe7XZygVS8M26Mc0mbQOPG+WICVM4gBWZO1zom8hpW4OIZQThyKEgadA==
X-Received: by 2002:a17:90a:8a8c:: with SMTP id x12mr11189416pjn.44.1634273942586;
        Thu, 14 Oct 2021 21:59:02 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c24sm4054526pgj.63.2021.10.14.21.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 21:59:02 -0700 (PDT)
Message-ID: <61690a96.1c69fb81.6b7c5.d5ae@mx.google.com>
Date:   Thu, 14 Oct 2021 21:59:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-10-14-v5.15-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 5 runs,
 1 regressions (renesas-next-2021-10-14-v5.15-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 5 runs, 1 regressions (renesas-next-2021-10-14-v=
5.15-rc1)

Regressions Summary
-------------------

platform                  | arch | lab          | compiler | defconfig     =
  | regressions
--------------------------+------+--------------+----------+---------------=
--+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre | gcc-8    | sunxi_defconfi=
g | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-10-14-v5.15-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-10-14-v5.15-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f9d9ae67a71d1c68b9961af72940aae2685f838b =



Test Regressions
---------------- =



platform                  | arch | lab          | compiler | defconfig     =
  | regressions
--------------------------+------+--------------+----------+---------------=
--+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre | gcc-8    | sunxi_defconfi=
g | 1          =


  Details:     https://kernelci.org/test/plan/id/616909c6e25f3bfad53358e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-14-v5.15-rc1/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-=
a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-14-v5.15-rc1/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-=
a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/616909c6e25f3bfad=
53358e2
        failing since 167 days (last pass: renesas-next-2021-04-02-v5.12-rc=
2, first fail: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276) =

 =20
