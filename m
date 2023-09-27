Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FB8B7B072A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Sep 2023 16:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232050AbjI0OmW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Sep 2023 10:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232107AbjI0OmV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Sep 2023 10:42:21 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAFE5F5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Sep 2023 07:42:17 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-690bccb0d8aso8846241b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Sep 2023 07:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695825736; x=1696430536; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zjPbw76j2UxjjUV6msKvyOwDpWMSI3m2BZeZkCU0QQQ=;
        b=ddGVg7LuuFjcqP9PT0ZEPCeYE6kogZOqn3SM1Q0ioZTgFEkBQUy3Vy5vnhLUF/RUQu
         NB/qqfZdIc6pWZ2nflU4z6unCdy8tZGI6vFa1ju8fk5kuM1NYQjLaA6iGBC4UBJwi7PY
         6oCWSHnGnI/hgr3lihDaYKaqzxkcgaY2GcXtgNMO2l2AieCsLCkWkDpyVskiCPxwFopQ
         fWkWEQeIdQQfFSzhcMOBeSh20ApnbFYfqJBibrn5/ClhxsG6isrzM6poprsmTLQ9u5FT
         MmQ3F6xY8ap2cUisurHy2ZtZr8h4nmttWPfmed45cml4jsqh8LCEiSOjT/+eWbu1FOBC
         LFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695825736; x=1696430536;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zjPbw76j2UxjjUV6msKvyOwDpWMSI3m2BZeZkCU0QQQ=;
        b=rGfVwq62qPnxd/z3YJPzUZ7RBJsudQRBPKlDleezKuc53xebCGyvYwQeGf9OSAOZDK
         1Qa7ib0pERLg7e/vcdK5aMpcjMrc0Z3n0jtaQ/4Lz/Yf6VA0D4UMPT8Pk5ruJFMuv55A
         ghnAeL+0iznIFB2VL3qOGgGpFpO5nmz9kaOw1j3Rk4zWH32JIAVNKp/44W//vFtWxLcS
         0IGj1NYXggoJfngsUe0ReSVwNT0TJpAKxLg0b0OZsH9oB5O03doEkdHvaIw83yDz+3iV
         9vQEQBysinQOCrx6muSTg1hCK1qN4Buzg1sz68sMJENg8uHxlM1GXtJqB09AccxSq5Sz
         EcmA==
X-Gm-Message-State: AOJu0YzPiieORCQbMwP2rZvFBwHzH0SY3e4KWjhlwO/M9QliVrUwvgCF
        LNmjA9gQx6529cByN9d1/n1ESR2rr2WtuQrrwXfM9g==
X-Google-Smtp-Source: AGHT+IHtCLfebC4byi+/laSw73QYgR2340EtmNAfmk8kawv1iGszVtr0M/EYhmV35GR59PiN4fiyaQ==
X-Received: by 2002:a05:6a20:9382:b0:160:6174:6b44 with SMTP id x2-20020a056a20938200b0016061746b44mr2353716pzh.42.1695825736707;
        Wed, 27 Sep 2023 07:42:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id iz19-20020a170902ef9300b001bc35b14c99sm13219172plb.212.2023.09.27.07.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 07:42:16 -0700 (PDT)
Message-ID: <65143f48.170a0220.6c755.61cd@mx.google.com>
Date:   Wed, 27 Sep 2023 07:42:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-09-27-v6.6-rc3
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 13 runs,
 1 regressions (renesas-devel-2023-09-27-v6.6-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 13 runs, 1 regressions (renesas-devel-2023-09-=
27-v6.6-rc3)

Regressions Summary
-------------------

platform                 | arch  | lab     | compiler | defconfig | regress=
ions
-------------------------+-------+---------+----------+-----------+--------=
----
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-09-27-v6.6-rc3/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-09-27-v6.6-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      8ef2954909a55f94e5eb8777c18c1d8b0678e3e7 =



Test Regressions
---------------- =



platform                 | arch  | lab     | compiler | defconfig | regress=
ions
-------------------------+-------+---------+----------+-----------+--------=
----
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65140ed11cdd4594b08a0abb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-27-v6.6-rc3/arm64/defconfig/gcc-10/lab-cip/baseline-nfs-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-09-27-v6.6-rc3/arm64/defconfig/gcc-10/lab-cip/baseline-nfs-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65140ed11cdd4594b=
08a0abc
        failing since 43 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-08-14-v6.5-rc4) =

 =20
